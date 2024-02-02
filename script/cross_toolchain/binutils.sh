#!/bin/bash

SRC_COMPRESSED_FILE=binutils-2.41.tar.xz
SRC_FOLDER=binutils-2.41

build_source_package() {
    mkdir -pv build
    cd build
    ../configure --prefix=$LFS/tools \
		 --with-sysroot=$LFS \
		 --target=$LFS_TGT \
		 --disable-nls \
		 --enable-gprofng=no \
		 --disable-werror
    make $MAKEFLAGS
    make install
}
