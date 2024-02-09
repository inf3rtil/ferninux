#!/bin/bash

PACKAGE_NAME="xwd"
VERSION="1.0.9"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xwd-1.0.9.tar.xz"
MD5_SUM="b0081fb92ae56510958024242ed1bc23"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
