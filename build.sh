#!/bin/bash

dir=`readlink -f "$(dirname "$0")"`
docker build -t tassoevan/executable "$dir/"executable/
docker build -t tassoevan/cordova-builder "$dir/"builder/
