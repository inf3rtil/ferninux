#!/bin/bash

PACKAGE_NAME=xcb-util-wm
VERSION=0.4.2
DOWNLOAD_URL=https://xcb.freedesktop.org/dist/xcb-util-wm-0.4.2.tar.xz
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure $XORG_CONFIG &&
	make $MAKEFLAGS
    make install
}

