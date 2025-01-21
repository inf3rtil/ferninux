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
MD5_SUM="523c50c6318dde6f9dc523bc0244690a"
DOWNLOAD_URLS[$MD5_SUM]="https://ftp.gnu.org/gnu/mpfr/mpfr-4.2.1.tar.xz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    ./configure --prefix=/usr        \
		--disable-static     \
		--enable-thread-safe \
		--docdir=/usr/share/doc/mpfr-4.2.1
}

test_source_package(){
    make check
}

build_source_package(){
    make $MAKEFLAGS
    make html
    test_source_package
}

install_source_package(){
    make install
    make install-html
}
