#!/bin/bash

PACKAGE_NAME=xbitmaps
VERSION=1.1.3
DOWNLOAD_URL=https://www.x.org/pub/individual/data/xbitmaps-1.1.3.tar.xz
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure $XORG_CONFIG
    make install
}

