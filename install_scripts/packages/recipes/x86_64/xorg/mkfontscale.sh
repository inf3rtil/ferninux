#!/bin/bash

PACKAGE_NAME="mkfontscale"
VERSION="1.2.2"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/mkfontscale-1.2.2.tar.xz"
MD5_SUM="fd2e6e5a297ac2bf3d7d54799bf69de0"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
