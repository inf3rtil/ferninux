#!/bin/bash
# package recipe for ferninux build
# rename this file as package-[cfg]-version.sh
# arrays for download and build
unset DOWNLOAD_URLS
declare -A DOWNLOAD_URLS
declare -a MD5_SUM=()
declare -a BUILD_DEPS=()
declare -a RUNTIME_DEPS=()

src_file=$BASH_SOURCE

# package details
MD5_SUM="a075178a9646551379bfb64040487715"
DOWNLOAD_URLS[$MD5_SUM]="https://ftp.gnu.org/gnu/binutils/binutils-2.42.tar.xz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}


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
