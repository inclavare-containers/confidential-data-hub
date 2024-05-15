
# Confidential-Data-Hub (CDH)

Confidential Data Hub (`CDH`) is a service running inside the guest to provide resource related APIs.

For more information, please visit the project's [repository](https://github.com/confidential-containers/guest-components/blob/main/confidential-data-hub/README.md).

## Build CDH Images

CDH supports two kinds of interfaces: gRPC and ttrpc. Please select the corresponding Dockerfile to build your CDH image.

### Prerequisites

- Ensure Docker is installed on your system

### Build Image

```shell
# Clone the repository and prepare for building
git clone https://github.com/jingyao-zhang/docker-confidential-data-hub && \
    cd docker-confidential-data-hub

# Build CDH image with gRPC interface
make build-grpc

# Build CDH image with ttrpc interface
make build-ttrpc
```

To build a specific commit of CDH, set the `CDH_COMMIT` environment variable before building. Run `make help` for full help information.

## Run CDH Images

Depending on whether you are using the gRPC or ttrpc interface, running the CDH image varies slightly.

### Run CDH image with gRPC interface

```shell
docker run -d \
    --name cdh-grpc confidential-data-hub:grpc
```

### Run CDH image with ttrpc interface

```shell
docker run -d \
    --name cdh-ttrpc confidential-data-hub:ttrpc
```
