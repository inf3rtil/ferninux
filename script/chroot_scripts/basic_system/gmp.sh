#!/bin/bash

SRC_COMPRESSED_FILE=gmp-6.2.1.tar.xz
SRC_FOLDER=gmp-6.2.1

build_source_package(){
    ./configure --prefix=/usr \
		--enable-cxx \
		--disable-static \
		--docdir=/usr/share/doc/gmp-6.2.1
    make $MAKEFLAGS
    make html
    make check 2>&1 | tee gmp-check-log
    awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log
    make install
    make install-html
}

