#!/bin/bash

PACKAGE_NAME="sessreg"
VERSION="1.1.3"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/sessreg-1.1.3.tar.xz"
MD5_SUM="05423bb42a006a6eb2c36ba10393de23"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
