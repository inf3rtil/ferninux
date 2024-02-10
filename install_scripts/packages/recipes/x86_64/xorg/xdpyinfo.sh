#!/bin/bash

PACKAGE_NAME="xdpyinfo"
VERSION="1.3.4"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xdpyinfo-1.3.4.tar.xz"
MD5_SUM="933e6d65f96c890f8e96a9f21094f0de"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
