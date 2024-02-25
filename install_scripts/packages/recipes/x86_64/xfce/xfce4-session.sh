#!/bin/bash

PACKAGE_NAME=xfce4-session
VERSION=4.18.3
DOWNLOAD_URL=https://archive.xfce.org/src/xfce/xfce4-session/4.18/xfce4-session-4.18.3.tar.bz2
MD5_SUM=dfdcb697a2315168e2e56a70f17a19b7
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr \
            --sysconfdir=/etc \
            --disable-legacy-sm &&
	make $MAKEFLAGS
    make install
    update-desktop-database &&
	update-mime-database /usr/share/mime
}

