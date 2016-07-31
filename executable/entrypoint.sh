#!/bin/bash

CONTAINER_UID=${HOST_UID:-9001}

useradd --shell /bin/bash -u $CONTAINER_UID -o -c "" -m user
export HOME=/home/user

if [[ "$#" -gt 0 ]]; then
    exec /usr/local/bin/gosu user "$@"
else
    exec /usr/local/bin/gosu user /bin/bash
fi
