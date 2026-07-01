FROM cgr.dev/chainguard/curl:latest-dev AS builder

ARG GARAGE_VERSION
ARG GARAGE_RELEASE

WORKDIR /extract/garage
RUN curl --silent --show-error --location --output garage \
  "${GARAGE_RELEASE}" \
  && chmod 0755 /tmp/garage

FROM scratch

ARG GARAGE_VERSION

COPY --from=builder /extract/garage/garage /usr/bin/garage
COPY ./passwd /etc/passwd
COPY ./shadow /etc/shadow

USER garage
WORKDIR /var/lib/garage
ENV HOME=/var/lib/garage PATH=/usr/bin

ENTRYPOINT ["/usr/bin/garage"]
CMD ["server"]

LABEL org.opencontainers.image.title="distroless garage"
LABEL org.opencontainers.image.description="distroless garage"
LABEL org.opencontainers.image.version="${GARAGE_VERSION}"
LABEL org.opencontainers.image.source="https://github.com/simons-containers/distroless-garage"
LABEL org.opencontainers.image.volumes.data="/var/lib/garage"
