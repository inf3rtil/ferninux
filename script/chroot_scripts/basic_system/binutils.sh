#!/bin/bash

SRC_COMPRESSED_FILE=binutils-2.40.tar.xz
SRC_FOLDER=binutils-2.40

build_source_package(){
    expect -c "spawn ls"
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
    make -k check
    grep '^FAIL:' $(find -name '*.log')
    make tooldir=/usr install
    rm -fv /usr/lib/lib{bfd,ctf,ctf-nobfd,sframe,opcodes}.a
    rm -fv /usr/share/man/man1/{gprofng,gp-*}.1
}

