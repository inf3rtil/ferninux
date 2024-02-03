#!/bin/bash

set -e

if [[ -z $ENV_VARS_EXPORTED ]]; then
    echo "Env variables not found, probable solutions:"
    echo "1 - source set_env_vars.sh"
    echo "2 - use sudo -E flag"
    exit 1
fi

device_boot=$(mount | grep $LFS/boot | cut -d ' ' -f1)

if [[ -n $device_boot ]]; then
    umount -v $device_boot
fi

device_root=$(mount | grep $LFS | cut -d ' ' -f1)
if [[ -n $device_root ]]; then
    umount -v $device_root
fi

loop_device=$(losetup -j $WORK_DIR/$VDISK_FILENAME | cut -d ':' -f1)
echo "BOOT: $device_boot"
echo "ROOT: $device_root"
echo "LOOP: $loop_device"
if [[ -n $loop_device ]]; then
    losetup --verbose -d $loop_device
else
    echo "no loop devices found"
fi

losetup -D
losetup
echo "done"
