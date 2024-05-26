
# Confidential-Data-Hub (CDH)

Confidential Data Hub (`CDH`) is a service running inside the guest to provide resource related APIs.

For more information, please visit the project's [repository](https://github.com/confidential-containers/guest-components/tree/ed809e5ea632055b62751de31191023290104882/confidential-data-hub/README.md).

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
docker run -d --network host \
    --name cdh-grpc confidential-data-hub:grpc
```

### Run CDH image with ttrpc interface

```shell
docker run -d -v /run/confidential-containers:/run/confidential-containers \
    --name cdh-ttrpc confidential-data-hub:ttrpc
```

## Test Built Images

### Prerequisites

- Ensure Docker is installed on your system
- Ensure [Client Tools](https://github.com/confidential-containers/guest-components/tree/ed809e5ea632055b62751de31191023290104882/confidential-data-hub#client-tool) are installed on your host system

### Run Tests

```shell
# grpc
# terminal 1
make build-grpc TEST=true
docker run --rm --network host confidential-data-hub:grpc
# terminal 2
grpc-cdh-tool get-resource --resource-uri kbs://127.0.0.1:50000/default/key/1

# ttrpc
# terminal 1
make build-ttrpc TEST=true
docker run --rm -v /run/confidential-containers:/run/confidential-containers confidential-data-hub:ttrpc
# terminal 2
ttrpc-cdh-tool get-resource --resource-uri kbs:///default/key/1
```