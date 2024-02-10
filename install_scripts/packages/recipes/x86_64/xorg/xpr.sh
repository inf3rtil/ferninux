#!/bin/bash

PACKAGE_NAME="xpr"
VERSION="1.1.0"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xpr-1.1.0.tar.xz"
MD5_SUM="9cf272cba661f7acc35015f2be8077db"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
