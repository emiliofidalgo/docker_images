#!/usr/bin/env bash

UID=`id -u $USER`
GID=`id -g $USER`

docker build \
	--build-arg USER=$USER \
	--build-arg UID=$UID \
	--build-arg GID=$GID \
	-f Dockerfile.cpu \
	-t bvlc/caffe:cpu-user \
	.

docker build \
	--build-arg USER=$USER \
	--build-arg UID=$UID \
	--build-arg GID=$GID \
	-f Dockerfile.gpu \
	-t bvlc/caffe:gpu-user \
	.
