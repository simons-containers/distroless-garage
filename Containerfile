FROM archlinux:base-devel-20260308.0.497099 AS builder

ARG GARAGE_VERSION

ADD https://garagehq.deuxfleurs.fr/_releases/v${GARAGE_VERSION}/x86_64-unknown-linux-musl/garage /garage
RUN chmod 0755 /garage

FROM scratch

ARG GARAGE_VERSION

COPY --from=builder /garage /usr/bin/garage
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
