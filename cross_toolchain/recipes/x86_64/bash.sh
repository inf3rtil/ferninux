#!/bin/bash

SRC_COMPRESSED_FILE=bash-5.2.15.tar.gz
SRC_FOLDER=bash-5.2.15

build_source_package(){
    ./configure --prefix=/usr \
		--build=$(sh support/config.guess) \
		--host=$LFS_TGT \
		--without-bash-malloc # use glibc malloc instead of bash
    make $MAKEFLAGS
    make DESTDIR=$LFS install
    ln -sv bash $LFS/bin/sh
}

