#!/bin/bash

SRC_COMPRESSED_FILE=gcc-13.2.0.tar.xz
SRC_FOLDER=gcc-13.2.0

build_source_package(){
    mkdir -pv build
    cd build
    ../libstdc++-v3/configure \
	--host=$LFS_TGT \
	--build=$(../config.guess) \
	--prefix=/usr \
	--disable-multilib \
	--disable-nls \
	--disable-libstdcxx-pch \
	--with-gxx-include-dir=/tools/$LFS_TGT/include/c++/13.2.0
    make $MAKEFLAGS
    make DESTDIR=$LFS install
    rm -v $LFS/usr/lib/lib{stdc++,stdc++fs,supc++}.la
}
    
