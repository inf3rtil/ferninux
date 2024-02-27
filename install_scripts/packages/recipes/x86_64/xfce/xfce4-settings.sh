#!/bin/bash

PACKAGE_NAME=xfce4-settings
VERSION=4.18.3
DOWNLOAD_URL=https://archive.xfce.org/src/xfce/xfce4-settings/4.18/xfce4-settings-4.18.3.tar.bz2
MD5_SUM=1113c82e1ca6fe3738cc80ccf629b6e5
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr --sysconfdir=/etc &&
	make $MAKEFLAGS
    make install
}

