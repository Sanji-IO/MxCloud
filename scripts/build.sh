#!/bin/bash

set -e

ARCH=${ARCH:-armhf}

echo "* Get latest docker image"
docker pull sanji/python-dev:$ARCH

echo "* Build bundles dependencies into *.whl package"
docker run --rm -v `pwd`:/data sanji/python-dev:$ARCH