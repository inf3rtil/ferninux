#!/bin/bash

SRC_COMPRESSED_FILE=expect5.45.4.tar.gz
SRC_FOLDER=expect5.45.4

build_source_package(){
    ./configure --prefix=/usr \
		--with-tcl=/usr/lib \
		--enable-shared \
		--mandir=/usr/share/man \
		--with-tclinclude=/usr/include
    make $MAKEFLAGS
    make test
    make install
    ln -svf expect5.45.4/libexpect5.45.4.so /usr/lib
}

