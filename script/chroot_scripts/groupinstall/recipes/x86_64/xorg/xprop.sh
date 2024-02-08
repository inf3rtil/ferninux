#!/bin/bash

PACKAGE_NAME="xprop"
VERSION="1.2.6"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xprop-1.2.6.tar.xz"
MD5_SUM="33c090d8632a300e63efbf36edd6a333"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
