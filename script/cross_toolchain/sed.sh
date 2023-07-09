#!/bin/bash

SRC_COMPRESSED_FILE=sed-4.9.tar.xz
SRC_FOLDER=sed-4.9

build_source_package(){
    ./configure --prefix=/usr \
		--host=$LFS_TGT
    make $MAKEFLAGS
    make DESTDIR=$LFS install
}

