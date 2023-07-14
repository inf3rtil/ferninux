#!/bin/bash

SRC_COMPRESSED_FILE=bash-5.2.15.tar.gz
SRC_FOLDER=bash-5.2.15

build_source_package(){
    ./configure --prefix=/usr \
		--without-bash-malloc \
		--with-installed-readline \
		--docdir=/usr/share/doc/bash-5.2.15
    make $MAKEFLAGS
    make install
    #exec /usr/bin/bash --login
}

