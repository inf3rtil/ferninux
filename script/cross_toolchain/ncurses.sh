#!/bin/bash

SRC_COMPRESSED_FILE=ncurses-6.4.tar.gz
SRC_FOLDER=ncurses-6.4

build_source_package(){
    sed -i s/mawk// configure
    mkdir build
    pushd build
    ../configure
    make -C include
    make -C progs tic
    popd
    ./configure --prefix=/usr \
		--host=$LFS_TGT \
		--build=$(./config.guess) \
		--mandir=/usr/share/man \
		--with-manpage-format=normal \
		--with-shared \
		--without-normal \
		--with-cxx-shared \
		--without-debug \
		--without-ada \
		--disable-stripping \
		--enable-widec
    make $MAKEFLAGS
    make DESTDIR=$LFS TIC_PATH=$(pwd)/build/progs/tic install
    echo "INPUT(-lncursesw)" > $LFS/usr/lib/libncurses.so
}
    
    
    
    

