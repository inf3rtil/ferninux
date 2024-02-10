#!/bin/bash

PACKAGE_NAME=libinput
VERSION=1.23.0
DOWNLOAD_URL=https://gitlab.freedesktop.org/libinput/libinput/-/archive/1.23.0/libinput-1.23.0.tar.gz
MD5_SUM=1faafdbe54745b5b59305b0764155a15
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson setup --prefix=$XORG_PREFIX    \
              --buildtype=release      \
              -Ddebug-gui=false        \
              -Dtests=false            \
              -Dlibwacom=false         \
              -Dudev-dir=/usr/lib/udev \
              ..                      &&
	ninja
    ninja install

}

