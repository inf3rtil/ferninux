#!/bin/bash

SRC_COMPRESSED_FILE=kbd-2.5.1.tar.xz
SRC_FOLDER=kbd-2.5.1

build_source_package(){
    patch -Np1 -i ../kbd-2.5.1-backspace-1.patch
    sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure
    sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in
    ./configure --prefix=/usr --disable-vlock
    make $MAKEFLAGS
    make install
    mkdir -pv /usr/share/doc/kbd-2.5.1
    cp -R -v docs/doc/* /usr/share/doc/kbd-2.5.1
}

