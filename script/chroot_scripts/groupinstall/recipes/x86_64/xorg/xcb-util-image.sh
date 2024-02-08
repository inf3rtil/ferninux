#!/bin/bash

PACKAGE_NAME=xcb-util-image
VERSION=0.4.1
DOWNLOAD_URL=https://xcb.freedesktop.org/dist/xcb-util-image-0.4.1.tar.xz
SRC_COMPRESSED_FILE=$(echo $url | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure $XORG_CONFIG &&
	make $MAKEFLAGS
    make install
}

