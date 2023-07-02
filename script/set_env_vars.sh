#!/bin/bash

WORK_DIR=workdir
LFS_DIR=lfs
LFS=$PWD/$WORK_DIR/$LFS_DIR
LFS_USER=ferninux

VDISK_SIZE_GB=5
VDISK_FILENAME=ferninux.img
VDISK_LABEL=gpt
VDISK_ROOT_PART=p2

WGET_FILE=$PWD/wget-list-systemd

MAKEFLAGS="-j16"
