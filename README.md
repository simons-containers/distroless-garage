# Distroless Garage container

Bare-bones distroless Garage container image from `scratch`.

## Running

Mount config to `/etc/garage.toml` for configuration, mount data directories under `/var/lib/garage`

Example:

```bash
docker run -it --rm \
  -v ./garage.toml:/etc/garage.toml \
  -v ./data:/var/lib/garage \
  ghcr.io/simons-containers/distroless-garage:latest
```

## Building

| Arg | Description |
|---|---|
| `GARAGE_VERSION` | Version of Garage to use

Build container using build-args from versions.yaml:

```bash
docker build -t \
  distroless-garage:$(yq -r .garage versions.yaml) \
  $(yq -r 'to_entries | .[] | "--build-arg \(.key | ascii_upcase)_VERSION=\(.value)"' versions.yaml) -f Containerfile .
```

## License

Repository contents (e.g., `Containerfile`, build scripts, and configuration) are licensed under the **MIT License**.

Software included in built container images (such as **Garage**) are provided under their respective upstream licenses and are not covered by the MIT license for this repository.

## Acknowledgements

This project depends on a number of upstream components and data sources:

- **Garage** - An open-source distributed object storage service tailored for self-hosting  
  https://garagehq.deuxfleurs.fr/