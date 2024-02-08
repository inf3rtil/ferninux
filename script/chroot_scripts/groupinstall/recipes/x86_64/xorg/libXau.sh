#!/bin/bash

PACKAGE_NAME=libXau
VERSION=1.0.11
DOWNLOAD_URL=https://www.x.org/pub/individual/lib/libXau-1.0.11.tar.xz
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure $XORG_CONFIG &&
	make $MAKEFLAGS
    make install
}

