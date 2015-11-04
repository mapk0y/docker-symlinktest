#!/bin/bash

set -ue
set -x
IMAGE_NAME=symlinktest
docker images --quiet --all ${IMAGE_NAME} | xargs -r docker rmi >/dev/null
docker build --no-cache -t ${IMAGE_NAME} .
docker run --rm ${IMAGE_NAME} ls -l /opt
