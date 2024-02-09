#!/bin/bash

PACKAGE_NAME=libevdev
VERSION=1.13.1
DOWNLOAD_URL=https://www.freedesktop.org/software/libevdev/libevdev-1.13.1.tar.xz
MD5_SUM=58fe71aa6fd5e80d0928e9b691761311 
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&
	
	meson setup ..                 \
	      --prefix=$XORG_PREFIX    \
	      --buildtype=release      \
	      -Ddocumentation=disabled &&
	ninja
    ninja install
}

