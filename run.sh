#!/bin/bash

dir=`readlink -f "$(dirname "$0")"`
docker run \
    -it \
    --rm \
    --env HOST_UID=`id -u` \
    --volume="$(pwd)":/src \
    tassoevan/cordova-builder "$@"
