#!/bin/bash

SRC_COMPRESSED_FILE=diffutils-3.10.tar.xz
SRC_FOLDER=diffutils-3.10

build_source_package(){
    ./configure --prefix=/usr --host=$LFS_TGT --build=$(./build-aux/config.guess)
    make $MAKEFLAGS
    make DESTDIR=$LFS install
}

