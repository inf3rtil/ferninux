#!/bin/bash

PACKAGE_NAME="xhost"
VERSION="1.0.9"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xhost-1.0.9.tar.xz"
MD5_SUM="48ac13856838d34f2e7fca8cdc1f1699"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
