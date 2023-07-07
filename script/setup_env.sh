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
if [[ -z $device ]]; then
    if test -f "$WORK_DIR/$VDISK_FILENAME"; then
	echo "$VDISK_FILENAME found"
	echo "mounting loop device"
	disk_loop=$(losetup --partscan --show --verbose --find $WORK_DIR/$VDISK_FILENAME)
	echo "mounting root partition"
	mount -v -t ext4 "$disk_loop"p2 $LFS
    else
	echo "$VDISK_FILENAME not found"
    fi
else
    echo "$device already mounted"
fi


