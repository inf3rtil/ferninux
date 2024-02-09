#!/bin/bash

PACKAGE_NAME="xwininfo"
VERSION="1.1.6"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xwininfo-1.1.6.tar.xz"
MD5_SUM="c91201bc1eb5e7b38933be8d0f7f16a8"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
