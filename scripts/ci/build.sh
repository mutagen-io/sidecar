#!/bin/bash

# Disable cgo.
export CGO_ENABLED=0

# Create the build directory.
mkdir build

# Build the entry point.
echo "Building entry point..."
pushd build > /dev/null
go build ../cmd/mutagen-sidecar-entry
popd > /dev/null

# Build the Docker image.
docker image build --file "docker/${TRAVIS_OS_NAME}/Dockerfile" --tag "${DEPLOYMENT_TARGET}" .
