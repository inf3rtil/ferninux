#!/bin/bash

set -e

if [[ -z $ENV_VARS_EXPORTED ]]; then
    echo "Env variables not found, probable solutions:"
    echo "1 - source set_env_vars.sh"
    echo "2 - use sudo -E flag"
    exit 1
fi

device=$(mount | grep $LFS | cut -d ' ' -f1)
disk_loop=$(losetup -j $BUILD_DIR/$VDISK_FILENAME | cut -d ':' -f1)
if [[ -z $device ]]; then
    if test -f "$BUILD_DIR/$VDISK_FILENAME"; then
	if [[ -z $disk_loop ]]; then
	    disk_loop=$(losetup --partscan --show --verbose --find $BUILD_DIR/$VDISK_FILENAME)
	fi
	mount -v -t ext4 $disk_loop$VDISK_ROOT_PART $LFS
	mount -v -t ext2 $disk_loop$VDISK_BOOT_PART $LFS/boot
	if test $USE_UEFI; then
	    mount -v $disk_loop$VDISK_UEFI_PART $LFS/boot/efi
	fi
    else
	echo "$VDISK_FILENAME not found"
    fi
else
    echo "$device already mounted"
fi


