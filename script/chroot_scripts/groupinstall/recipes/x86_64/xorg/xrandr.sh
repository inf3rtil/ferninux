#!/bin/bash

PACKAGE_NAME="xrandr"
VERSION="1.5.2"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xrandr-1.5.2.tar.xz"
MD5_SUM="f822a8d5f233e609d27cc22d42a177cb"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
