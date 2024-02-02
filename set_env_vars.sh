#!/bin/bash

# Directories 
export WORK_DIR=$PWD
export BUILD_DIR=$WORK_DIR/build
export LFS=$BUILD_DIR/lfs
export CHROOT_SCRIPTS_DIR=$WORK_DIR/script/chroot_scripts
export BACKUP_DIR=$WORK_DIR/backup
export BACKUP_FILE=ferninux_backup.tar.xz
export DOWNLOAD_DIR=$WORK_DIR/downloads

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
export VDISK_PATH=$BUILD_DIR/$VDISK_FILENAME

# Download
export WGET_FILE=$WORK_DIR/script/wget-list-systemd
export CHECKSUM_FILE=$WORK_DIR/script/sources_md5

# Build
export MAKEFLAGS="-j16"
export ENV_VARS_EXPORTED=1

# Config
export USE_UEFI=0
export INIT_SYSTEM=systemd
