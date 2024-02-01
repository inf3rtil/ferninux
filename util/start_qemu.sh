#!/bin/bash

if [[ $ENV_VARS_EXPORTED -ne 1 ]]; then
    echo "Env variables not found, probable solutions:"
    echo "1 - source set_env_vars.sh"
    exit 1
fi

qemu-system-x86_64 -drive format=raw,file=$WORK_DIR/$VDISK_FILENAME -vga std
