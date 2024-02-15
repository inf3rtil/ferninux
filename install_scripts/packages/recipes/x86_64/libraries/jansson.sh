#!/bin/bash

PACKAGE_NAME=jansson
VERSION=2.14
DOWNLOAD_URL=https://github.com/akheron/jansson/releases/download/v2.14/jansson-2.14.tar.bz2
MD5_SUM=3f90473d7d54ebd1cb6a2757396641df
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    sed -e "/DT/s;| sort;| sed 's/@@libjansson.*//' &;" \
	-i test/suites/api/check-exports
    ./configure --prefix=/usr --disable-static &&
	make $MAKEFLAGS
    make install
}

