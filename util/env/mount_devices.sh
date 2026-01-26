#!/bin/bash

set -e

if [[ -z $ENV_VARS_EXPORTED ]]; then
    echo "Env variables not found, probable solutions:"
    echo "1 - source set_env_vars.sh"
    echo "2 - use sudo -E flag"
    exit 1
fi

mount_devices(){
    echo "EXEC: mounting devices..."
    echo "DEBUG: LFS var is $LFS"
    disk_loop=$(mount | grep $LFS | cut -d ' ' -f1)
    #check if there is a loop device associated with the virtual disk 
    #disk_loop=$(losetup -j $BUILD_DIR/$VDISK_FILENAME | cut -d ':' -f1)
    if [[ -z $disk_loop ]]; then
	if test -f "$BUILD_DIR/$VDISK_FILENAME"; then
	    if [[ -z $disk_loop ]]; then
		disk_loop=$(losetup --partscan --show --verbose --find $BUILD_DIR/$VDISK_FILENAME)
		echo "created loop device: $disk_loop"
		loop=$(echo $disk_loop | cut -d '/' -f3)
		partx -u $disk_loop 
		grep ${loop}p /proc/partitions | while read major minor blocks name; do
		    [ -b /dev/$name ] || mknod /dev/$name b $major $minor
		done
	    fi
	    mount -v -t ext4 $disk_loop$VDISK_ROOT_PART $LFS
	    mount -v -t ext2 $disk_loop$VDISK_BOOT_PART $LFS/boot
	    if test $USE_UEFI -eq 1; then
		mount -v $disk_loop$VDISK_EFI_PART $LFS/boot/efi
	    fi
	    echo "devices mounted!"
	else
	    echo "$VDISK_FILENAME not found"
	fi
    else
	echo "$device already mounted"
    fi
    echo "DONE: mounting devices"
}
