#!/bin/bash

PACKAGE_NAME=libogg
VERSION=1.3.5
DOWNLOAD_URL=https://downloads.xiph.org/releases/ogg/libogg-1.3.5.tar.xz
MD5_SUM=3178c98341559657a15b185bf5d700a5
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/libogg-1.3.5 &&
	make $MAKEFLAGS
    make install
}

