#!/bin/bash

PACKAGE_NAME=xfce4-panel
VERSION=4.18.4
DOWNLOAD_URL=https://archive.xfce.org/src/xfce/xfce4-panel/4.18/xfce4-panel-4.18.4.tar.bz2
MD5_SUM=4e0d462fdeda0efaba79b4845fa49c10
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr --sysconfdir=/etc &&
	make $MAKEFLAGS
    make install
}

