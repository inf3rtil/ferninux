#!/bin/bash
# package recipe for ferninux build
# rename this file as foo-[cfg]-version.sh
# arrays for download and build
set ISRECIPE
unset DOWNLOAD_URLS
declare -A DOWNLOAD_URLS
declare -a MD5_SUM=()
declare -a BUILD_DEPS=()
declare -a RUNTIME_DEPS=()

# package details
PACKAGE_NAME=binutils
VERSION=2.4.2
DOWNLOAD_URLS["a075178a9646551379bfb64040487715"]="https://sourceware.org/pub/binutils/releases/binutils-2.42.tar.xz"
SRC_COMPRESSED_FILE=$(echo ${DOWNLOAD_URLS["a075178a9646551379bfb64040487715"]} | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

config_source_package(){
    mkdir -v build
    cd       build
    ../configure --prefix=$LFS/tools \
             --with-sysroot=$LFS \
             --target=$LFS_TGT   \
             --disable-nls       \
             --enable-gprofng=no \
             --disable-werror    \
             --enable-default-hash-style=gnu
}

build_source_package(){
    make $MAKEFLAGS
}

install_source_package(){
    make install
}
