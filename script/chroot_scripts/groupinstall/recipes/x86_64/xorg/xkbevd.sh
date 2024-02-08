#!/bin/bash

PACKAGE_NAME="xkbevd"
VERSION="1.1.5"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xkbevd-1.1.5.tar.xz"
MD5_SUM="05ce1abd8533a400572784b1186a44d0"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
