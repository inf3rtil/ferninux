#!/bin/bash

PACKAGE_NAME="luit"
VERSION="1.1.1"
DOWNLOAD_URL="https://www.x.org/pub/individual/app/luit-1.1.1.tar.bz2"
MD5_SUM="c4a3664e08e5a47c120ff9263ee2f20c"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    sed -i -e "/D_XOPEN/s/5/6/" configure
    ./configure $XORG_CONFIG
    make $MAKEFLAGS
    make install
}
