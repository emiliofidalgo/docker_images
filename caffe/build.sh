#!/usr/bin/env bash

docker build --build-arg USER=$USER -f Dockerfile.cpu -t bvlc/caffe:cpu-user .
docker build --build-arg USER=$USER -f Dockerfile.gpu -t bvlc/caffe:gpu-user .
