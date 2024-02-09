#!/bin/bash

SRC_COMPRESSED_FILE=flex-2.6.4.tar.gz
SRC_FOLDER=flex-2.6.4

build_source_package(){
    ./configure --prefix=/usr \
		--docdir=/usr/share/doc/flex-2.6.4 \
		--disable-static
    make $MAKEFLAGS
    make install
    ln -sv flex /usr/bin/lex
    ln -sv flex.1 /usr/share/man/man1/lex.1
}

