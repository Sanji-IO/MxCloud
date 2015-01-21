#!/bin/bash

set -e

ARCH=${ARCH:-armhf}
COMMIT_BUILD=${COMMIT_BUILD:-1}
BUILD_DIR=${BUILD_DIR:-`pwd`}
IMAGE=${IMAGE:-sanji/python-dev:$ARCH}

echo "* Get latest docker image"
docker pull $IMAGE

echo "* Build bundles dependencies into $BUILD_DIR/*.whl package"
docker run --rm -v $BUILD_DIR:/data $IMAGE

if [ $COMMIT_BUILD == "1" ]; then
	git add build/* && git commit build/* -m "Build @ `date +'%Y.%m.%d %H:%M:%S'`"
fi