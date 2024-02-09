#!/bin/bash

PACKAGE_NAME="iceauth"
VERSION="1.0.9"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/iceauth-1.0.9.tar.xz"
MD5_SUM="5d3feaa898875484b6b340b3888d49d8"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
