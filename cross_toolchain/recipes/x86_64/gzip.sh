#!/bin/bash

SRC_COMPRESSED_FILE=gzip-1.12.tar.xz
SRC_FOLDER=gzip-1.12

build_source_package(){
    ./configure --prefix=/usr --host=$LFS_TGT
    make $MAKEFLAGS
    make DESTDIR=$LFS install
}

