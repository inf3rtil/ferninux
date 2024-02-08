#!/bin/bash

PACKAGE_NAME="xev"
VERSION="1.2.5"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xev-1.2.5.tar.xz"
MD5_SUM="61219e492511b3d78375da76defbdc97"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
