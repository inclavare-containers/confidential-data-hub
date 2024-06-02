CDH_COMMIT ?=

default_cdh_commit := ed809e5

ifeq ($(CDH_COMMIT),)
    cdh_commit := $(default_cdh_commit)
else
    cdh_commit := $(CDH_COMMIT)
endif

no_cache :=
ifneq ($(findstring $(cdh_commit),$(default_cdh_commit)),$(default_cdh_commit))
    no_cache := --no-cache
endif

.PHONE: all build build-image-grpc build-image-ttrpc

all: help

help: ## Print this help information
	@awk -F ':|##' '/^[^\t].+?:.*?##/ { printf "\033[36m%-20s\033[0m", $$1; for (i=3; i<=NF; i++) printf " %s", $$i; printf "\n" }' $(MAKEFILE_LIST)

build: build-grpc build-ttrpc ## Build the confidential-data-hub images with CDH_COMMIT to set the commit to build

build-grpc: ## Build the confidential-data-hub grpc image with CDH_COMMIT to set the commit to build
	@echo "\033[1;32mBuilding the confidential-data-hub for grpc with the commit $(cdh_commit) ...\033[0m"
	docker build \
	    $(no_cache) --build-arg CDH_COMMIT=$(cdh_commit) \
	    -f ./Dockerfile.grpc -t confidential-data-hub:grpc .

build-ttrpc: ## Build the confidential-data-hub ttrpc image with CDH_COMMIT to set the commit to build
	@echo "\033[1;32mBuilding the confidential-data-hub for ttrpc with the commit $(cdh_commit) ...\033[0m"
	docker build \
	    $(no_cache) --build-arg CDH_COMMIT=$(cdh_commit) \
	    -f ./Dockerfile.ttrpc -t confidential-data-hub:ttrpc .
