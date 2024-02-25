#!/bin/bash

PACKAGE_NAME=tumbler
VERSION=4.18.1
DOWNLOAD_URL=https://archive.xfce.org/src/xfce/tumbler/4.18/tumbler-4.18.1.tar.bz2
MD5_SUM=e66ff221ea5cd19c84ce80abca033f52
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr --sysconfdir=/etc &&
	make $MAKEFLAGS
    make install
}

