#!/bin/bash

PACKAGE_NAME="xrdb"
VERSION="1.2.2"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xrdb-1.2.2.tar.xz"
MD5_SUM="c8629d5a0bc878d10ac49e1b290bf453"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
