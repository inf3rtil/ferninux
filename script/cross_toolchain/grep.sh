#!/bin/bash

SRC_COMPRESSED_FILE=grep-3.8.tar.xz
SRC_FOLDER=grep-3.8

build_source_package(){
    ./configure --prefix=/usr \
		--host=$LFS_TGT
    make $MAKEFLAGS
    make DESTDIR=$LFS install
}

