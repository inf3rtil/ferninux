#!/bin/bash

# Directories 
export WORK_DIR=$PWD/workdir
export LFS_DIR=lfs
export LFS=$WORK_DIR/$LFS_DIR
export CHROOT_SCRIPTS_DIR=$PWD/script/chroot_scripts
export BACKUP_DIR=$WORK_DIR/backup
export BACKUP_FILE=ferninux_backup.tar.xz

# User
export LFS_USER=ferninux

# Disk
export VDISK_SIZE_GB=30
export VDISK_FILENAME=ferninux.img
export VDISK_LABEL=gpt
export VDISK_BIOS_PART=p1
export VDISK_BOOT_PART=p2
export VDISK_ROOT_PART=p3
export VDISK_SWAP_PART=p4

# Download
export WGET_FILE=script/wget-list-systemd

# Build
export MAKEFLAGS="-j16"
export ENV_VARS_EXPORTED=1

# Config
export USE_UEFI=0
export INIT_SYSTEM=systemd
