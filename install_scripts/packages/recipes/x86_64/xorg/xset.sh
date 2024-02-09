#!/bin/bash

PACKAGE_NAME="xset"
VERSION="1.2.5
1.1.3"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/xset-1.2.5.tar.xz
xsetroot-1.1.3.tar.xz"
MD5_SUM="18ff5cdff59015722431d568a5c0bad2
fa9a24fe5b1725c52a4566a62dd0a50d"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
     ./configure $XORG_CONFIG
     make $MAKEFLAGS
     make install
}
