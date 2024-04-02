Confidential Data Hub (aka CDH) is a service running inside the guest to provide resource related APIs.

This repository packages the CDH into an easy-to-use image.

For more details, please visit [Confidential Data Hub](https://github.com/confidential-containers/guest-components/blob/main/confidential-data-hub/README.md)

# Build CDH Image

CDH offers ttrpc interface.

## Prerequisites

- Ensure Docker is installed on your system

## Build CDH Image

``` shell
# download code
git clone --recurse-submodules \
    https://github.com/inclavare-containers/confidential-data-hub.git && \
    cd confidential-data-hub

# build CDH image with ttrpc interface
docker build -f ./Dockerfile.ttrpc -t cdh:ttrpc .
```

# Run CDH image with Docker

## Prerequisites

- Docker is installed on your host system
- FUSE is supported and enabled on your host system
- Installed CDH image

## RUN CDH image

Run image in the background.
``` shell
# TODO: use `--privileged` is dangerous, a better way should be applied
#       to get access to `/dev/fuse`.
docker run -d --privileged \
    --device /dev/fuse \
    --name cdh-ttrpc cdh:ttrpc
```