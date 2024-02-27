#!/bin/bash

PACKAGE_NAME=libnl
VERSION=3.7.0
DOWNLOAD_URL=https://github.com/thom311/libnl/releases/download/libnl3_7_0/libnl-3.7.0.tar.gz
MD5_SUM=b381405afd14e466e35d29a112480333
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --disable-static  &&
	make $MAKEFLAGS
    make install
}

