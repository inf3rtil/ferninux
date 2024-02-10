#!/bin/bash

PACKAGE_NAME="xrefresh"
VERSION="1.0.7"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xrefresh-1.0.7.tar.xz"
MD5_SUM="33b04489e417d73c90295bd2a0781cbb"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
