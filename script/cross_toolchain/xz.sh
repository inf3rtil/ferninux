#!/bin/bash

SRC_COMPRESSED_FILE=xz-5.4.1.tar.xz
SRC_FOLDER=xz-5.4.1

build_source_package(){
    ./configure --prefix=/usr \
		--host=$LFS_TGT \
		--build=$(build-aux/config.guess) \
		--disable-static \
		--docdir=/usr/share/doc/xz-5.4.1
    make $MAKEFLAGS
    make DESTDIR=$LFS install
    rm -v $LFS/usr/lib/liblzma.la
}

