#!/bin/bash
# package recipe for ferninux build
# rename this file as foo-[cfg].sh

# arrays for download and build
unset DOWNLOAD_URLS
unset BUILD_DEPS
unset RUNTIME_DEPS
declare -A DOWNLOAD_URLS
declare -a BUILD_DEPS=()
declare -a RUNTIME_DEPS=()

# package details
MD5_SUM="a075178a9646551379bfb64040487715"
DOWNLOAD_URLS[$MD5_SUM]="https://sourceware.org/pub/binutils/releases/binutils-2.42.tar.xz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    mkdir -v build
    cd       build
    ../configure --prefix=/usr       \
		 --sysconfdir=/etc   \
		 --enable-gold       \
		 --enable-ld=default \
		 --enable-plugins    \
		 --enable-shared     \
		 --disable-werror    \
		 --enable-64-bit-bfd \
		 --with-system-zlib  \
		 --enable-default-hash-style=gnu
}

test_source_package(){
    make -i check
    mkdir -pv /build_log/binutils
    cp *.log /build_log/binutils/
}

build_source_package(){
    make tooldir=/usr $MAKEFLAGS
    test_source_package
}


install_source_package(){
    make install
    rm -fv /usr/lib/lib{bfd,ctf,ctf-nobfd,gprofng,opcodes,sframe}.a
}
