#!/bin/bash

PACKAGE_NAME="xcursorgen"
VERSION="1.0.8"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xcursorgen-1.0.8.tar.xz"
MD5_SUM="89e81a1c31e4a1fbd0e431425cd733d7"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
