#!/bin/bash

set -e

if [[ $ENV_VARS_EXPORTED -ne 1 ]]; then
    echo "Env variables not found, probable solutions:"
    echo "1 - source set_env_vars.sh"
    echo "2 - use sudo -E flag"
    exit 1
fi

disk=$WORK_DIR/$VDISK_FILENAME

echo "creating LFS:($LFS) dir"
mkdir -pv $WORK_DIR/$LFS_DIR

if test -f "$WORK_DIR/$VDISK_FILENAME"; then
    echo "$VDISK_FILENAME found"
    echo "mounting loop device"
    disk_loop=$(losetup --partscan --show --verbose --find $disk)
else
    echo "$VDISK_FILENAME not found"
    echo "creating virtual disk image: $VDISK_FILENAME file"
    dd if=/dev/zero of=$disk bs=1G count=$VDISK_SIZE_GB status=progress
    
    echo "creating $VDISK_LABEL label on $VDISK_FILENAME"
    parted -s $disk mklabel $VDISK_LABEL
    echo "creating boot partition on $VDISK_FILENAME"
    parted -s $disk mkpart boot fat32 1Mib 512Mib
    echo "creating root partition on $VDISK_FILENAME"
    parted -s $disk mkpart root ext4 512Mib 100%
    echo "set esp flag on boot partition"
    parted -s $disk set 1 esp on
    disk_loop=$(losetup --partscan --show --verbose --find $disk)
    root_part=$disk_loop$VDISK_ROOT_PART
    echo "format boot partition as FAT32"
    mkfs.vfat -v -F32 $disk_loop\p1
    echo "formate root partition as ext4"
    mkfs.ext4 -v $root_part
fi

echo "mounting root partition"
mount -v -t ext4 "$disk_loop"p2 $LFS

echo "creating directories"
mkdir -pv $LFS/sources
chmod -v a+wt $LFS/sources
mkdir -pv $LFS/{etc,var} $LFS/usr/{bin,lib,sbin}

for i in bin lib sbin; do
    ln -sv usr/$i $LFS/$i
done

case $(uname -m) in
    x86_64) mkdir -pv $LFS/lib64 ;;
esac

mkdir -pv $LFS/tools

echo "cleaning"
umount -v "$disk_loop"p2
losetup --verbose -d $disk_loop

