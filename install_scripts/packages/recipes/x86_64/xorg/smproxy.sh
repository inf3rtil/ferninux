#!/bin/bash

PACKAGE_NAME="smproxy"
VERSION="1.0.7"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/smproxy-1.0.7.tar.xz"
MD5_SUM="9f7a4305f0e79d5a46c3c7d02df9437d"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
