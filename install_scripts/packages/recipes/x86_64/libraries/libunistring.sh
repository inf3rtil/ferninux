#!/bin/bash

PACKAGE_NAME=libunistring
VERSION=1.1
DOWNLOAD_URL=https://ftp.gnu.org/gnu/libunistring/libunistring-1.1.tar.xz
MD5_SUM=0dfba19989ae06b8e7a49a7cd18472a1
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/libunistring-1.1 &&
	make $MAKEFLAGS
    make install
}

