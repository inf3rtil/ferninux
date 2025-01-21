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
MD5_SUM="4017e96f89fca45ca946f1c5db6be714"
DOWNLOAD_URLS[$MD5_SUM]="https://ftp.gnu.org/gnu/automake/automake-1.16.5.tar.xz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    ./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.16.5
    
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    make -j$(($(nproc)>4?$(nproc):4)) check
}

install_source_package(){
    make install
}
