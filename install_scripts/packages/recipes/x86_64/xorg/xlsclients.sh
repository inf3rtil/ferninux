#!/bin/bash

PACKAGE_NAME="xlsclients"
VERSION="1.1.5"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xlsclients-1.1.5.tar.xz"
MD5_SUM="ab4b3c47e848ba8c3e47c021230ab23a"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
