#!/bin/bash

SRC_COMPRESSED_FILE=mpfr-4.2.0.tar.xz
SRC_FOLDER=mpfr-4.2.0

build_source_package(){
    sed -e 's/+01,234,567/+1,234,567 /' \
	-e 's/13.10Pd/13Pd/' \
	-i tests/tsprintf.c
    ./configure --prefix=/usr \
		--disable-static \
		--enable-thread-safe \
		--docdir=/usr/share/doc/mpfr-4.2.0
    make $MAKEFLAGS
    make html
    make check
    make install
    make install-html
}

