#!/bin/bash

PACKAGE_NAME=libxfce4ui
VERSION=4.18.4
DOWNLOAD_URL=https://archive.xfce.org/src/xfce/libxfce4ui/4.18/libxfce4ui-4.18.4.tar.bz2
MD5_SUM=67b193ed7d9a7cc50c37e6e772648956
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr --sysconfdir=/etc &&
	make $MAKEFLAGS
    make install
}

