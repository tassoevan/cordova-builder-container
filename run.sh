#!/bin/bash

dir=`readlink -f "$(dirname "$0")"`
docker run -it --rm tassoevan/cordova-builder $*