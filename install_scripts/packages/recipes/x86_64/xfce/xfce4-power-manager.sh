#!/bin/bash

PACKAGE_NAME=xfce4-power-manager
VERSION=4.18.2
DOWNLOAD_URL=https://archive.xfce.org/src/xfce/xfce4-power-manager/4.18/xfce4-power-manager-4.18.2.tar.bz2
MD5_SUM=bc5333fdd3dcd305483e2a44a5e0d90b
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr --sysconfdir=/etc &&
	make $MAKEFLAGS
    make install
}

