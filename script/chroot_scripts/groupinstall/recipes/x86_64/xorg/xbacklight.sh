#!/bin/bash

PACKAGE_NAME="xbacklight"
VERSION="1.2.3"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xbacklight-1.2.3.tar.bz2"
MD5_SUM="5b6405973db69c0443be2fba8e1a8ab7"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
