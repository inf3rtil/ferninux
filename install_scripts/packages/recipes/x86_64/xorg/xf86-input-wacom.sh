#!/bin/bash

PACKAGE_NAME=xf86-input-wacom
VERSION=1.2.0
DOWNLOAD_URL=https://github.com/linuxwacom/xf86-input-wacom/releases/download/xf86-input-wacom-1.2.0/xf86-input-wacom-1.2.0.tar.bz2
MD5_SUM=9de66dbfa7dbb3897708d35776da0108
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure $XORG_CONFIG &&
	make $MAKEFLAGS
    make install
}

