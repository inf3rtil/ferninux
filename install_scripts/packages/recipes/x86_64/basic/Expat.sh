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
MD5_SUM="eeb1cf76f51dadebff73fe6aa317ba37"
DOWNLOAD_URLS[$MD5_SUM]="https://github.com/libexpat/libexpat/releases/download/R_2_6_0/expat-2.6.0.tar.bz2"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    ./configure --prefix=/usr    \
		--disable-static \
		--docdir=/usr/share/doc/expat-2.6.0
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    make check
}

install_source_package(){
    make install
}
