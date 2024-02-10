#!/bin/bash

PACKAGE_NAME="xmodmap"
VERSION="1.0.11"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xmodmap-1.0.11.tar.xz"
MD5_SUM="0d66e07595ea083871048c4b805d8b13"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
