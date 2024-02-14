#!/bin/bash

PACKAGE_NAME=duktape
VERSION=2.7.0
DOWNLOAD_URL=https://duktape.org/duktape-2.7.0.tar.xz
MD5_SUM=b3200b02ab80125b694bae887d7c1ca6
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    sed -i 's/-Os/-O2/' Makefile.sharedlibrary
    make -f Makefile.sharedlibrary INSTALL_PREFIX=/usr
    make -f Makefile.sharedlibrary INSTALL_PREFIX=/usr install
}

