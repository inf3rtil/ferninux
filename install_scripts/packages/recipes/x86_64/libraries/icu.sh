#!/bin/bash

PACKAGE_NAME=icu
VERSION=73-2
DOWNLOAD_URL=https://github.com/unicode-org/icu/releases/download/release-73-2/icu4c-73_2-src.tgz
MD5_SUM=b8a4b8cf77f2e2f6e1341eac0aab2fc4
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME

build_source_package(){
    cd source                                    &&

	./configure --prefix=/usr                    &&
	make $MAKEFLAGS
    make install
}
