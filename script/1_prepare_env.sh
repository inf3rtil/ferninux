#!/bin/bash

set -e


. ./set_env_vars.sh

script_path=$PWD

echo "creating LFS:($LFS) dir"
mkdir -pv $WORK_DIR
cd $WORK_DIR
mkdir -pv $LFS


if test -f "$VDISK_FILENAME"; then
    echo "$VDISK_FILENAME found"
    echo "mounting loop device"
    disk_loop=$(losetup --partscan --show --verbose --find $VDISK_FILENAME)
else
    echo "$VDISK_FILENAME not found"
    echo "creating virtual disk image: $VDISK_FILENAME file"
    dd if=/dev/zero of=$VDISK_FILENAME bs=1G count=$VDISK_SIZE_GB status=progress
    
    echo "creating $VDISK_LABEL label on $VDISK_FILENAME"
    parted -s $VDISK_FILENAME mklabel $VDISK_LABEL
    echo "creating boot partition on $VDISK_FILENAME"
    parted -s $VDISK_FILENAME mkpart boot fat32 1Mib 512Mib
    echo "creating root partition on $VDISK_FILENAME"
    parted -s $VDISK_FILENAME mkpart root ext4 512Mib 100%
    echo "set esp flag on boot partition"
    parted -s $VDISK_FILENAME set 1 esp on
    disk_loop=$(losetup --partscan --show --verbose --find $VDISK_FILENAME)
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


cd $script_path
