#!/bin/bash

set -e

if [[ -z $ENV_VARS_EXPORTED ]]; then
    echo "Env variables not found, probable solutions:"
    echo "1 - source set_env_vars.sh"
    echo "2 - use sudo -E flag"
    exit 1
fi

device=$(mount | grep $LFS | cut -d ' ' -f1)
echo "$device"
if [[ -n $device ]]; then
    umount -v $device
    losetup --verbose -D
else
    echo "no devices to umount"
fi
losetup
#fix search for loop and unmount
