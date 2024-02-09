#!/bin/bash

PACKAGE_NAME="xwud"
VERSION="1.0.6"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xwud-1.0.6.tar.xz"
MD5_SUM="5ff5dc120e8e927dc3c331c7fee33fc3"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
