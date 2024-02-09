#!/bin/bash

SRC_COMPRESSED_FILE=binutils-2.41.tar.xz  
SRC_FOLDER=binutils-2.41

build_source_package(){
    sed '6009s/$add_dir//' -i ltmain.sh
    mkdir -v build
    cd build
    ../configure \
	--prefix=/usr \
	--build=$(../config.guess) \
	--host=$LFS_TGT \
	--disable-nls \
	--enable-shared \
	--enable-gprofng=no \
	--disable-werror \
	--enable-64-bit-bfd
    make $MAKEFLAGS
    make DESTDIR=$LFS install
    rm -v $LFS/usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes}.{a,la}
}

