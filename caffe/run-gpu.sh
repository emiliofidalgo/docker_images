#!/usr/bin/env bash
set -e

xhost +local:root
GPU=0

nvidia-docker run --rm -ti \
	-u $USER:$USER \
	-h caffe-gpu \
	-e DISPLAY=unix$DISPLAY \
	-v $HOME:$HOME:rw \
	-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
	-w $HOME \
	bvlc/caffe:gpu-user

xhost -local:root
