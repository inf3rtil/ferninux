#!/bin/bash

set -e

KERNEL_VERSION='6.4.12'
KERNEL_COMPRESSED_FILE=linux-$KERNEL_VERSION.tar.xz
KERNEL_SRC_FOLDER=linux-$KERNEL_VERSION

SCRIPT=$(realpath -s "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")
CONFIG=$SCRIPT_PATH/config/$FERNINUX_TARGET_ARCH/config-$KERNEL_VERSION

SOURCES_ROOT_DIR=/sources

tar xvf $SOURCES_ROOT_DIR/$KERNEL_COMPRESSED_FILE -C $SOURCES_ROOT_DIR
cd $SOURCES_ROOT_DIR/$KERNEL_SRC_FOLDER

make mrproper
cp $CONFIG ./.config
#make menuconfig

make $MAKEFLAGS

make modules_install

cp -iv arch/x86/boot/bzImage /boot/vmlinuz-6.4.12-lfs-12.0-systemd
cp -iv System.map /boot/System.map-6.4.12
cp -iv .config /boot/config-6.4.12
cp -r Documentation -T /usr/share/doc/linux-6.4.12

make mrproper

chown -R 0:0 $SOURCES_ROOT_DIR/$KERNEL_SRC_FOLDER
cd /
mv -f $SOURCES_ROOT_DIR/$KERNEL_SRC_FOLDER /usr/src/
