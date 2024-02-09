#!/bin/bash

SRC_COMPRESSED_FILE=file-5.45.tar.gz
SRC_FOLDER=file-5.45

build_source_package(){
    mkdir build
    pushd build
    ../configure --disable-bzlib \
		 --disable-libseccomp \
		 --disable-xzlib \
		 --disable-zlib
    make
    popd
    ./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess)
    make $MAKEFLAGS FILE_COMPILE=$(pwd)/build/src/file
    make DESTDIR=$LFS install
    rm -v $LFS/usr/lib/libmagic.la
}

