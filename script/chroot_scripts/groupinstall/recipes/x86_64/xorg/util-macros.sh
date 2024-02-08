#!/bin/bash

PACKAGE_NAME=util-macros
VERSION=1.20.0
DOWNLOAD_URL=https://www.x.org/pub/individual/util/util-macros-1.20.0.tar.xz
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure $XORG_CONFIG
    make install
}

