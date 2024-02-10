#!/bin/bash

PACKAGE_NAME="setxkbmap"
VERSION="1.3.4"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/setxkbmap-1.3.4.tar.xz"
MD5_SUM="1d61c9f4a3d1486eff575bf233e5776c"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
