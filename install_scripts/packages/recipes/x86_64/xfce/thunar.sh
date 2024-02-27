#!/bin/bash

PACKAGE_NAME=thunar
VERSION=4.18.6
DOWNLOAD_URL=https://archive.xfce.org/src/xfce/thunar/4.18/thunar-4.18.6.tar.bz2
MD5_SUM=dc9ccd48acfd2ca9c9ca46631ee35e35
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/thunar-4.18.6 &&
	make $MAKEFLAGS
    make install
}

