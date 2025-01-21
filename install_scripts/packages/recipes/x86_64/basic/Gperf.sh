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
MD5_SUM="9e251c0a618ad0824b51117d5d9db87e"
DOWNLOAD_URLS[$MD5_SUM]="https://ftp.gnu.org/gnu/gperf/gperf-3.1.tar.gz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    ./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    make -j1 check
}

install_source_package(){
    make install
}
