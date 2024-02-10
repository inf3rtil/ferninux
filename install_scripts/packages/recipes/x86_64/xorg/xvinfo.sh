#!/bin/bash

PACKAGE_NAME="xvinfo"
VERSION="1.1.5"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xvinfo-1.1.5.tar.xz"
MD5_SUM="d698862e9cad153c5fefca6eee964685"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
