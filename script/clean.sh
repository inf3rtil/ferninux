#!/bin/bash

if [[ $ENV_VARS_EXPORTED -ne 1 ]]; then
    echo "Env variables not found, probable solutions:"
    echo "1 - source set_env_vars.sh"
    echo "2 - use sudo -E flag"
    exit 1
fi

cd $WORK_DIR
losetup -D
rm -rf ./*.img
rm -rf ./lfs
