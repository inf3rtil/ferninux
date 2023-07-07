#!/bin/bash

# Directories 
export WORK_DIR=$PWD/workdir
export LFS_DIR=lfs
export LFS=$WORK_DIR/$LFS_DIR

# User
export LFS_USER=ferninux

# Disk
export VDISK_SIZE_GB=30
export VDISK_FILENAME=ferninux.img
export VDISK_LABEL=gpt
export VDISK_ROOT_PART=p2

# Donwload
export WGET_FILE=script/wget-list-systemd

# Build
export MAKEFLAGS="-j16"

export ENV_VARS_EXPORTED=1
