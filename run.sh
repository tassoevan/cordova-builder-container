#!/bin/bash

dir=`readlink -f "$(dirname "$0")"`
docker run -it --rm --volume=`pwd`:/src tassoevan/cordova-builder $*