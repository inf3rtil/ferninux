#!/bin/bash

PACKAGE_NAME=lcms2
VERSION=2.14
DOWNLOAD_URL=https://github.com/mm2/Little-CMS/releases/download/lcms2.14/lcms2-2.14.tar.gz
MD5_SUM=7f7baa3e605c961b9301135105ee9a34
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    sed '/BufferSize < TagSize/,+1 s/goto Error/TagSize = BufferSize/' \
	-i src/cmsio0.c
    ./configure --prefix=/usr --disable-static &&
	make $MAKEFLAGS
    make install
}

