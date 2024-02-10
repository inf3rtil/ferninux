#!/bin/bash

PACKAGE_NAME="xkill"
VERSION="1.0.6"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xkill-1.0.6.tar.xz"
MD5_SUM="f62b99839249ce9a7a8bb71a5bab6f9d"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
