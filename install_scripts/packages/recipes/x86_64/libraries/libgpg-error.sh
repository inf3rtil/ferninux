#!/bin/bash

PACKAGE_NAME=libgpg-error
VERSION=1.47
DOWNLOAD_URL=https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.47.tar.bz2
MD5_SUM=58e054ca192a77226c4822bbee1b7fdb
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr &&
	make $MAKEFLAGS
    make install &&
	install -v -m644 -D README /usr/share/doc/libgpg-error-1.47/README
}

