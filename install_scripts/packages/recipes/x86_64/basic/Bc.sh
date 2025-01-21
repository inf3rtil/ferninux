#!/bin/bash
# package recipe for ferninux build
# rename this file as foo-[cfg]-version.sh
# arrays for download and build
unset DOWNLOAD_URLS
unset BUILD_DEPS
unset RUNTIME_DEPS
declare -A DOWNLOAD_URLS
declare -a BUILD_DEPS=()
declare -a RUNTIME_DEPS=()

src_file=$BASH_SOURCE

# package details
PACKAGE_NAME=bc
VERSION=$(echo ${src_file} | rev | cut -d '/' -f 1 | cut -d '-' -f 1 | cut -d '.' -f 2- | rev)
MD5_SUM="e249b1f86f886d6fb71c15f72b65dd3d"
DOWNLOAD_URLS[$MD5_SUM]="https://github.com/gavinhoward/bc/releases/download/6.7.5/bc-6.7.5.tar.xz"
SRC_COMPRESSED_FILE=$(echo ${DOWNLOAD_URLS[$MD5_SUM]}  | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

config_source_package(){
    CC=gcc ./configure --prefix=/usr -G -O3 -r
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    nake test
}

install_source_package(){
    make install
}
