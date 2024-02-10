#!/bin/bash

PACKAGE_NAME="xkbutils"
VERSION="1.0.5"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xkbutils-1.0.5.tar.xz"
MD5_SUM="cf65ca1aaf4c28772ca7993cfd122563"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
