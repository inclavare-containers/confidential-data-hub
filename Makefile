CDH_COMMIT ?= bf7ccd301d3f50bfcb4cc9e38ae187141ce35072

.PHONE: all build build-image-grpc build-image-ttrpc

all: help

help: ## Print this help information
	@awk -F ':|##' '/^[^\t].+?:.*?##/ { printf "\033[36m%-20s\033[0m", $$1; for (i=3; i<=NF; i++) printf " %s", $$i; printf "\n" }' $(MAKEFILE_LIST)

build: build-grpc build-ttrpc ## Build the confidential-data-hub images with CDH_COMMIT to set the commit to build

build-grpc: ## Build the confidential-data-hub grpc image with CDH_COMMIT to set the commit to build
	@echo "\033[1;32mBuilding the confidential-data-hub for grpc with the commit $(cdh_commit) ...\033[0m"
	docker build \
	    --no-cache --build-arg CDH_COMMIT=$(CDH_COMMIT) \
	    -f ./Dockerfile.grpc -t confidential-data-hub:grpc .

build-ttrpc: ## Build the confidential-data-hub ttrpc image with CDH_COMMIT to set the commit to build
	@echo "\033[1;32mBuilding the confidential-data-hub for ttrpc with the commit $(cdh_commit) ...\033[0m"
	docker build \
	    --no-cache --build-arg CDH_COMMIT=$(CDH_COMMIT) \
	    -f ./Dockerfile.ttrpc -t confidential-data-hub:ttrpc .
