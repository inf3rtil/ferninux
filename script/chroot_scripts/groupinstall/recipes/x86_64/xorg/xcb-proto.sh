#!/bin/bash

PACKAGE_NAME=xcb-proto
VERSION=1.16.0
DOWNLOAD_URL=https://xorg.freedesktop.org/archive/individual/proto/xcb-proto-1.16.0.tar.xz
SRC_COMPRESSED_FILE=$(echo $url | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    PYTHON=python3 ./configure $XORG_CONFIG
    make install
}

