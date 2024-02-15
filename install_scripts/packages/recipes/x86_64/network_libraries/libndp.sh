#!/bin/bash

PACKAGE_NAME=libndp
VERSION=1.8
DOWNLOAD_URL=http://libndp.org/files/libndp-1.8.tar.gz
MD5_SUM=c7e775fd5a9d676e8cba9c3732c4df93
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    ./configure --prefix=/usr        \
            --sysconfdir=/etc    \
            --localstatedir=/var \
            --disable-static     &&
	make $MAKEFLAGS
    make install
}

