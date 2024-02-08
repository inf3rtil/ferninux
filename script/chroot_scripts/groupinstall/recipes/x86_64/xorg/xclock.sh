#!/bin/bash

PACKAGE_NAME=xclock
VERSION=1.1.1
DOWNLOAD_URL=https://www.x.org/pub/individual/app/xclock-1.1.1.tar.xz
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure $XORG_CONFIG &&
	make $MAKEFLAGS
    make install
}

