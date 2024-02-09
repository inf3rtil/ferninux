#!/bin/bash

PACKAGE_NAME=xcb-util-renderutil
VERSION=0.3.10
DOWNLOAD_URL=https://xcb.freedesktop.org/dist/xcb-util-renderutil-0.3.10.tar.xz
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure $XORG_CONFIG &&
	make $MAKEFLAGS
    make install
}

