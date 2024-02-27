#!/bin/bash

PACKAGE_NAME=libxfce4util
VERSION=4.18.1
DOWNLOAD_URL=https://archive.xfce.org/src/xfce/libxfce4util/4.18/libxfce4util-4.18.1.tar.bz2
MD5_SUM=4a834c5dc207f33cde0e213bc4e8b5b1
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr &&
	make $MAKEFLAGS
    make install
}

