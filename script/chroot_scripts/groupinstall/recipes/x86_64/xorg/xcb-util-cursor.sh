#!/bin/bash

PACKAGE_NAME=xcb-util-cursor
VERSION=0.1.4
DOWNLOAD_URL=https://xcb.freedesktop.org/dist/xcb-util-cursor-0.1.4.tar.xz
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure $XORG_CONFIG &&
	make $MAKEFLAGS
    make install
}

