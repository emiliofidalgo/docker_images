#!/usr/bin/env bash
set -e

xhost +local:root

docker run --rm -ti \
	-u $USER:$USER \
	-h caffe-cpu \
	-e DISPLAY=unix$DISPLAY \
	-v $HOME:$HOME:rw \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-w $HOME \
	bvlc/caffe:cpu-user

xhost -local:root
