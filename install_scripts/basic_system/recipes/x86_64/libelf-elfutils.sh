#!/bin/bash

SRC_COMPRESSED_FILE=elfutils-0.189.tar.bz2
SRC_FOLDER=elfutils-0.189

build_source_package(){
    ./configure --prefix=/usr \
		--disable-debuginfod \
		--enable-libdebuginfod=dummy
    make $MAKEFLAGS
    make -C libelf install
    install -vm644 config/libelf.pc /usr/lib/pkgconfig
    rm /usr/lib/libelf.a
}

