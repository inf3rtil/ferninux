#!/bin/bash

# Config 
export FERNINUX_TARGET_ARCH=x86_64
export USE_UEFI=1
export INIT_SYSTEM=systemd
export FERNINUX_KERNEL_VERSION=6.7.4
export USE_DEFAULT_KERNEL_CONFIG=1

# Directories 
export WORK_DIR=$PWD
export BUILD_DIR=$WORK_DIR/build
export TEMP=$BUILD_DIR/temp
export LFS=$BUILD_DIR/lfs
export CHROOT_SCRIPTS_DIR=$WORK_DIR/install_scripts
export BACKUP_DIR=$WORK_DIR/backup
export BACKUP_FILE=ferninux_backup.tar.xz

# User
export LFS_USER=ferninux

# Disk
export VDISK_SIZE_GB=10
export VDISK_FILENAME=ferninux_$INIT_SYSTEM\_$FERNINUX_TARGET_ARCH.img
export VDISK_LABEL=gpt
export VDISK_BIOS_PART=p1
export VDISK_EFI_PART=p1
export VDISK_BOOT_PART=p2
export VDISK_ROOT_PART=p3
export VDISK_SWAP_PART=p4
export VDISK_PATH=$BUILD_DIR/$VDISK_FILENAME
export TARGET_PHY_DISK=' '

# Downloader
export KEEP_DOWNLOAD_FILES=1
export DOWNLOADED_FILES=$WORK_DIR/dowloads/download_success
export DOWNLOAD_DIR=$WORK_DIR/downloads

# Build
export MAKEFLAGS="-j32"
export ENV_VARS_EXPORTED=1

# Distrib
export INSTALLED_PACKAGES_FILE=/packages.install
