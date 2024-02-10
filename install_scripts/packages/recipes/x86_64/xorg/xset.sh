#!/bin/bash

PACKAGE_NAME="xset"
VERSION="1.2.5"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xset-1.2.5.tar.xz"
MD5_SUM="18ff5cdff59015722431d568a5c0bad2"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
