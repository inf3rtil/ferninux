#!/bin/bash

PACKAGE_NAME=garcon
VERSION=4.18.1
DOWNLOAD_URL=https://archive.xfce.org/src/xfce/garcon/4.18/garcon-4.18.1.tar.bz2
MD5_SUM=0c9dd937f595beb7052657c44f77c272
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr --sysconfdir=/etc &&
	make $MAKEFLAGS
    make install
}

