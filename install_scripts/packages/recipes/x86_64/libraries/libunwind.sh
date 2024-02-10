#!/bin/bash

PACKAGE_NAME=libunwind
VERSION=1.6.2
DOWNLOAD_URL=https://download.savannah.nongnu.org/releases/libunwind/libunwind-1.6.2.tar.gz
MD5_SUM=f625b6a98ac1976116c71708a73dc44a
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr --disable-static &&
	make $MAKEFLAGS
    make install
}

