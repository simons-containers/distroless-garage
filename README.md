[![Current Version](https://raw.githubusercontent.com/simons-containers/distroless-garage/badges/.badges/main/release.svg)](https://github.com/simons-containers/distroless-garage/pkgs/container/distroless-garage) [![Tags](https://raw.githubusercontent.com/simons-containers/distroless-garage/badges/.badges/main/tags.svg)](https://github.com/simons-containers/distroless-garage/pkgs/container/distroless-garage) <br> ![Current Size](https://raw.githubusercontent.com/simons-containers/distroless-garage/badges/.badges/main/size.svg) ![Wasted Size](https://raw.githubusercontent.com/simons-containers/distroless-garage/badges/.badges/main/wasted.svg) ![Efficiency](https://raw.githubusercontent.com/simons-containers/distroless-garage/badges/.badges/main/efficiency.svg) <br> ![Critical](https://raw.githubusercontent.com/simons-containers/distroless-garage/badges/.badges/main/critical.svg) ![High](https://raw.githubusercontent.com/simons-containers/distroless-garage/badges/.badges/main/high.svg) ![Medium](https://raw.githubusercontent.com/simons-containers/distroless-garage/badges/.badges/main/medium.svg) ![Low](https://raw.githubusercontent.com/simons-containers/distroless-garage/badges/.badges/main/low.svg) <br> [![Publish Workflow](https://img.shields.io/github/actions/workflow/status/simons-containers/distroless-garage/deploy.yaml?label=Publish%20Workflow&logo=github)](https://github.com/simons-containers/distroless-garage/actions/workflows/deploy.yaml) [![Update Workflow](https://img.shields.io/github/actions/workflow/status/simons-containers/distroless-garage/update-versions.yaml?label=Update%20Workflow&logo=github)](https://github.com/simons-containers/distroless-garage/actions/workflows/update-versions.yaml)

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

## License

Repository contents (e.g., `Containerfile`, build scripts, and configuration) are licensed under the **MIT License**.

Software included in built container images (such as **Garage**) are provided under their respective upstream licenses and are not covered by the MIT license for this repository.

## Acknowledgements

This project depends on a number of upstream components and data sources:

- **Garage** - An open-source distributed object storage service tailored for self-hosting  
  https://garagehq.deuxfleurs.fr/
