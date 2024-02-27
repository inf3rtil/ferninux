#!/bin/bash

PACKAGE_NAME=libva
VERSION=2.19.0
DOWNLOAD_URL=https://github.com/intel/libva/releases/download/2.19.0/libva-2.19.0.tar.bz2
MD5_SUM=66b1e5cb7b26ad2d6e72d54c8d61da6c
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    mkdir build &&
	cd    build &&

	meson setup --prefix=$XORG_PREFIX --buildtype=release &&
	ninja
    ninja install
}
