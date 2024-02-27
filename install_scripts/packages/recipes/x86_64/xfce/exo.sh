#!/bin/bash

PACKAGE_NAME=exo
VERSION=4.18.0
DOWNLOAD_URL=https://archive.xfce.org/src/xfce/exo/4.18/exo-4.18.0.tar.bz2
MD5_SUM=9d0be4e885eaf991e12dbc14d3fc628d
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr --sysconfdir=/etc &&
	make $MAKEFLAGS
    make install
}

