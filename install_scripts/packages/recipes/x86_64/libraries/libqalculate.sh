#!/bin/bash

PACKAGE_NAME=libqalculate
VERSION=4.7.0
DOWNLOAD_URL=https://github.com/Qalculate/libqalculate/releases/download/v4.7.0/libqalculate-4.7.0.tar.gz
MD5_SUM=7fcad72cb9779afc14fecdf0a0dcc9f1
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/libqalculate-4.7.0 &&
	make $MAKEFLAGS
    make install
}

