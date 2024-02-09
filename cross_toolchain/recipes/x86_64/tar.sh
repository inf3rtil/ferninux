#!/bin/bash

SRC_COMPRESSED_FILE=tar-1.35.tar.xz
SRC_FOLDER=tar-1.35

build_source_package(){
    ./configure --prefix=/usr \
		--host=$LFS_TGT \
		--build=$(build-aux/config.guess)
    make $MAKEFLAGS
    make DESTDIR=$LFS install
}

