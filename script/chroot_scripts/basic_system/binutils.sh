#!/bin/bash

SRC_COMPRESSED_FILE=binutils-2.41.tar.xz
SRC_FOLDER=binutils-2.41

build_source_package(){
    mkdir -v build
    cd build
    ../configure --prefix=/usr \
		 --sysconfdir=/etc \
		 --enable-gold \
		 --enable-ld=default \
		 --enable-plugins \
		 --enable-shared \
		 --disable-werror \
		 --enable-64-bit-bfd \
		 --with-system-zlib
    make $MAKEFLAGS tooldir=/usr
    make -i check
    cp *.log /build_log/
    #grep '^FAIL:' $(find -name '*.log')
    make tooldir=/usr install
    rm -fv /usr/lib/lib{bfd,ctf,ctf-nobfd,gprofng,opcodes,sframe}.a
}

