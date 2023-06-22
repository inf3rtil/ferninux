#!/bin/bash

LFS=./lfs
VDISK_SIZE_GB=30
VDISK_FILENAME=ferninux.img
VDISK_ROOT_PART=/dev/loop0p2

# create LFS folder
mdkir -p $LFS

# create virtual disk
# TODO: check if file exists
dd if=/dev/zero of=./lfs_vdisk.img bs=1G count=$VDISK_SIZE_GB status=progress

# TODO: make partition scheme!

# mount the virtual disk
# TODO: check if already mounted
losetup -P -f $VDISK_FILENAME

# format partitions
mkfs.vfat -F32 /dev/loop0p1
mkfs.ext4 $VDISK_ROOT_PART




