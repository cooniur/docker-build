#!/bin/bash

DOCKER_NAME="cooniur/jenkins"

DOCKER_LOCAL_TAG="$DOCKER_NAME:1.620"

DOCKER_REGISTRY="$1"
DOCKER_REGISTRY_TAG="$DOCKER_REGISTRY$DOCKER_LOCAL_TAG"
DOCKER_REGISTRY_LATEST_TAG="$DOCKER_REGISTRY$DOCKER_NAME:latest"

echo -e "\x1B[1;32m---- Building docker image \x1B[1;33m[$DOCKER_LOCAL_TAG]\x1B[1;32m...\x1B[0m"
docker build --force-rm=true --pull=true --tag="$DOCKER_LOCAL_TAG" -f Dockerfile "$(pwd)"

echo -e "\x1B[1;32m---- Build finished.\x1B[0m"
echo -e "\x1B[1;32m---- Pushing \x1B[1;33m[$DOCKER_REGISTRY_TAG]\x1B[1;32m and \x1B[1;33m[$DOCKER_REGISTRY_LATEST_TAG]\x1B[1;32m to registry...\x1B[0m"
docker tag -f $DOCKER_LOCAL_TAG $DOCKER_REGISTRY_TAG
docker tag -f $DOCKER_LOCAL_TAG $DOCKER_REGISTRY_LATEST_TAG

docker push $DOCKER_REGISTRY_TAG
docker push $DOCKER_REGISTRY_LATEST_TAG

echo -e "\x1B[1;32m---- Push finished.\x1B[0m"
echo -e "\x1B[1;32mAll finished.\x1B[0m"
