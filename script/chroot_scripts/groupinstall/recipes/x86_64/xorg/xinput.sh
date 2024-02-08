#!/bin/bash

PACKAGE_NAME="xinput"
VERSION="1.6.4"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xinput-1.6.4.tar.xz"
MD5_SUM="8e4d14823b7cbefe1581c398c6ab0035"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
