#!/bin/bash

PACKAGE_NAME="xgamma"
VERSION="1.0.7"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xgamma-1.0.7.tar.xz"
MD5_SUM="41afaa5a68cdd0de7e7ece4805a37f11"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
