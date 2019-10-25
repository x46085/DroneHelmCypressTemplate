#!/bin/bash
set -x

SERVICE_NAME=$1
[[ -n "$2" ]] && DOCKER_FILE=$2 || DOCKER_FILE=services/$SERVICE_NAME/Dockerfile
IMAGE_NAME=x46085/$SERVICE_NAME
TAG_NAME=$IMAGE_NAME:version-${DRONE_COMMIT_SHA:0:8}

set -e
LATEST_TAG_NAME=$IMAGE_NAME:latest

docker build -f $DOCKER_FILE -t $TAG_NAME -t $LATEST_TAG_NAME services
docker push $LATEST_TAG_NAME
docker push $TAG_NAME
