#!/bin/bash

# Log in to Docker Hub.
echo "${DEPLOYMENT_TOKEN}" | docker login -u "${DEPLOYMENT_USER}" --password-stdin

# Push the locally tagged image.
docker push "${DEPLOYMENT_TARGET}"

# Log out from Docker Hub.
docker logout
