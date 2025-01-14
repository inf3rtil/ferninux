#!/bin/bash

set -e

SCRIPT=$(realpath -s "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

#TODO: get version form env var
KERNEL_VERSION='6.7.4'
KERNEL_COMPRESSED_FILE=linux-$KERNEL_VERSION.tar.xz
KERNEL_SRC_FOLDER=linux-$KERNEL_VERSION

if [ -d /usr/src/$KERNEL_SRC_FOLDER ]; then
    echo "Kernel source in /usr/src found "
    cd /usr/src/$KERNEL_SRC_FOLDER
    make mrproper
    cp /boot/config-$KERNEL_VERSION ./.config
    make menuconfig
    make $MAKEFLAGS
    make modules_install
    cp -iv arch/x86/boot/bzImage /boot/vmlinuz-$KERNEL_VERSION-lfs-12.1-systemd
    cp -iv System.map /boot/System.map-$KERNEL_VERSION
    cp -iv .config /boot/config-$KERNEL_VERSION
    cp -r Documentation -T /usr/share/doc/linux-$KERNEL_VERSION
    chown -R 0:0 /usr/src/$KERNEL_SRC_FOLDER
    #mkinitramfs $KERNEL_VERSION
    #cp initrd.img-$KERNEL_VERSION /boot/
else
    CONFIG=$SCRIPT_PATH/config/$FERNINUX_TARGET_ARCH/config-$KERNEL_VERSION
    SOURCES_ROOT_DIR=/sources
    tar xvf $SOURCES_ROOT_DIR/$KERNEL_COMPRESSED_FILE -C $SOURCES_ROOT_DIR
    cd $SOURCES_ROOT_DIR/$KERNEL_SRC_FOLDER
    make mrproper
    make defconfig
    #cp $CONFIG ./.config
    make menuconfig
    make $MAKEFLAGS
    make modules_install
    cp -iv arch/x86/boot/bzImage /boot/vmlinuz-$KERNEL_VERSION-lfs-12.1-systemd
    cp -iv System.map /boot/System.map-$KERNEL_VERSION
    cp -iv .config /boot/config-$KERNEL_VERSION
    cp -r Documentation -T /usr/share/doc/linux-$KERNEL_VERSION
    chown -R 0:0 $SOURCES_ROOT_DIR/$KERNEL_SRC_FOLDER
    cd /
    mv -f $SOURCES_ROOT_DIR/$KERNEL_SRC_FOLDER /usr/src/
    #mkinitramfs $KERNEL_VERSION
    #cp initrd.img-$KERNEL_VERSION /boot/
fi
    

