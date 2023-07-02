#!/bin/bash

set -e

. ./set_env_vars.sh

device=$(mount | grep $LFS | cut -d ' ' -f1)
echo "$device"
if [[ -n $device ]]; then
    umount -v $device
    losetup --verbose -D
else
    echo "no devices to umount"
fi
losetup
