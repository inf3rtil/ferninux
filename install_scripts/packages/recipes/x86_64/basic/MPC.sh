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
MD5_SUM="5c9bc658c9fd0f940e8e3e0f09530c62"
DOWNLOAD_URLS[$MD5_SUM]="https://ftp.gnu.org/gnu/mpc/mpc-1.3.1.tar.gz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    ./configure --prefix=/usr    \
		--disable-static \
		--docdir=/usr/share/doc/mpc-1.3.1
}

build_source_package(){
    make $MAKEFLAGS
    make html
}

test_source_package(){
    make check
}

install_source_package(){
    make install
    make install-html
}
