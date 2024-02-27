#!/bin/bash

PACKAGE_NAME=libvorbis
VERSION=1.3.7
DOWNLOAD_URL=https://downloads.xiph.org/releases/vorbis/libvorbis-1.3.7.tar.xz
MD5_SUM=50902641d358135f06a8392e61c9ac77
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr --disable-static &&
	make $MAKEFLAGS
    

    make install &&
	install -v -m644 doc/Vorbis* /usr/share/doc/libvorbis-1.3.7
}

