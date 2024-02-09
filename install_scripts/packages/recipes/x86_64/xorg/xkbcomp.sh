#!/bin/bash

PACKAGE_NAME="xkbcomp"
VERSION="1.4.6"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xkbcomp-1.4.6.tar.xz"
MD5_SUM="a11d4d6eeda762f13818684c0670f89f"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
