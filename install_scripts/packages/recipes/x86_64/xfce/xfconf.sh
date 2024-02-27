#!/bin/bash

PACKAGE_NAME=xfconf
VERSION=4.18.1
DOWNLOAD_URL=https://archive.xfce.org/src/xfce/xfconf/4.18/xfconf-4.18.1.tar.bz2
MD5_SUM=60519958af4178d9bf110087a9c4a118
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr &&
	make $MAKEFLAGS
    make install
}

