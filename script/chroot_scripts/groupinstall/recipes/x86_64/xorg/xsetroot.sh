#!/bin/bash

PACKAGE_NAME="xsetroot"
VERSION="1.1.3"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xsetroot-1.1.3.tar.xz"
MD5_SUM="fa9a24fe5b1725c52a4566a62dd0a50d"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
