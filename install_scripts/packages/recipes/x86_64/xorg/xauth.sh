#!/bin/bash

PACKAGE_NAME="xauth"
VERSION="1.1.2"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xauth-1.1.2.tar.xz"
MD5_SUM="dbcf944eb59343b84799b2cc70aace16"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
