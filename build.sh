#!/usr/bin/env bash

# version tag for the image
tag='latest'
if [[ "$1" != "" ]]
then
  tag=$1
fi

docker build -t squid:$tag .