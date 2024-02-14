#!/bin/bash

PACKAGE_NAME=alsa-lib
VERSION=1.2.9
DOWNLOAD_URL=https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.9.tar.bz2
MD5_SUM=d29f5ebe9a4ff1be70508ecbf6655318
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure &&
	make $MAKEFLAGS
    make install
}

