#!/bin/bash

PACKAGE_NAME=libtirpc
VERSION=1.3.3
DOWNLOAD_URL=https://downloads.sourceforge.net/libtirpc/libtirpc-1.3.3.tar.bz2
MD5_SUM=bacdad5c27dcf6e2830b3e26a1c8ed3f
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr                                   \
            --sysconfdir=/etc                               \
            --disable-static                                \
            --disable-gssapi                                &&
	make $MAKEFLAGS
    make install
}

