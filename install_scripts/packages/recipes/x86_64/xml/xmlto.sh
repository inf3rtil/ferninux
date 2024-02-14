#!/bin/bash

PACKAGE_NAME=xmlto
VERSION=0.0.28
DOWNLOAD_URL=https://releases.pagure.org/xmlto/xmlto-0.0.28.tar.bz2
MD5_SUM=93bab48d446c826399d130d959fe676f
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    LINKS="/usr/bin/links" \
	 ./configure --prefix=/usr &&
	
	make $MAKEFLAGS
    make install
}

