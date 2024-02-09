#!/bin/bash

SRC_COMPRESSED_FILE=m4-1.4.19.tar.xz
SRC_FOLDER=m4-1.4.19

build_source_package(){
    ./configure --prefix=/usr \
		--host=$LFS_TGT \
		--build=$(build-aux/config.guess)
    make $MAKEFLAGS
    make DESTDIR=$LFS install
}
    
