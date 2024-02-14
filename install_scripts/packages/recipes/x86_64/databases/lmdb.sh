#!/bin/bash

PACKAGE_NAME=lmdb
VERSION=LMDB_0.9.31
DOWNLOAD_URL=https://github.com/LMDB/lmdb/archive/LMDB_0.9.31.tar.gz
MD5_SUM=9d7f059b1624d0a4d4b2f1781d08d600
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    cd libraries/liblmdb &&
	make                 &&
	sed -i 's| liblmdb.a||' Makefile
    make prefix=/usr install
}

