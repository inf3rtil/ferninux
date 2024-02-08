#!/bin/bash

PACKAGE_NAME="x11perf"
VERSION="1.6.1"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/x11perf-1.6.1.tar.bz2"
MD5_SUM="e96b56756990c56c24d2d02c2964456b"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
