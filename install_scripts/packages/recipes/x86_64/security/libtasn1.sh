#!/bin/bash

PACKAGE_NAME=libtasn1
VERSION=4.19.0
DOWNLOAD_URL=https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.19.0.tar.gz
MD5_SUM=f701ab57eb8e7d9c105b2cd5d809b29a
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr --disable-static &&
	make $MAKEFLAGS
    make install
    make -C doc/reference install-data-local
}

