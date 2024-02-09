#!/bin/bash

PACKAGE_NAME=xcursor-themes
VERSION=1.0.7
DOWNLOAD_URL=https://www.x.org/pub/individual/data/xcursor-themes-1.0.7.tar.xz
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr &&
	make $MAKEFLAGS
    make install
}

