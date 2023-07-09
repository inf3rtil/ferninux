#!/bin/bash

SRC_COMPRESSED_FILE=gawk-5.2.1.tar.xz
SRC_FOLDER=gawk-5.2.1

build_source_package(){
    sed -i 's/extras//' Makefile.in
    ./configure --prefix=/usr \
		--host=$LFS_TGT \
		--build=$(build-aux/config.guess)
    make $MAKEFLAGS
    make DESTDIR=$LFS install
}

