#!/bin/bash

PACKAGE_NAME=libsndfile
VERSION=1.2.2
DOWNLOAD_URL=https://github.com/libsndfile/libsndfile/releases/download/1.2.2/libsndfile-1.2.2.tar.xz
MD5_SUM=04e2e6f726da7c5dc87f8cf72f250d04
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr    \
            --docdir=/usr/share/doc/libsndfile-1.2.2 &&
	make $MAKEFLAGS
    make install
}

