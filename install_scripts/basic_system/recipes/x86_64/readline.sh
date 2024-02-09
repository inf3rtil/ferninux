#!/bin/bash

SRC_COMPRESSED_FILE=readline-8.2.tar.gz
SRC_FOLDER=readline-8.2

build_source_package(){
    sed -i '/MV.*old/d' Makefile.in
    sed -i '/{OLDSUFF}/c:' support/shlib-install
    patch -Np1 -i ../readline-8.2-upstream_fix-1.patch
    ./configure --prefix=/usr \
		--disable-static \
		--with-curses \
		--docdir=/usr/share/doc/readline-8.2
    make $MAKEFLAGS SHLIB_LIBS="-lncursesw"
    make SHLIB_LIBS="-lncursesw" install
    install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-8.2
}

