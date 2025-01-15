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
PACKAGE_NAME=binutils
VERSION=$(echo ${src_file} | rev | cut -d '/' -f 1 | cut -d '-' -f 1 | cut -d '.' -f 2- | rev)
MD5_SUM="a075178a9646551379bfb64040487715"
DOWNLOAD_URLS[$MD5_SUM]="https://sourceware.org/pub/binutils/releases/binutils-$VERSION.tar.xz"
SRC_COMPRESSED_FILE=$(echo ${DOWNLOAD_URLS[$MD5_SUM]}  | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

config_source_package(){
    sed '6009s/$add_dir//' -i ltmain.sh
    mkdir -v build
    cd       build
    ../configure                   \
	--prefix=/usr              \
	--build=$(../config.guess) \
	--host=$LFS_TGT            \
	--disable-nls              \
	--enable-shared            \
	--enable-gprofng=no        \
	--disable-werror           \
	--enable-64-bit-bfd        \
	--enable-default-hash-style=gnu
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    echo "tests are not implemented for this package"
}

install_source_package(){
    make DESTDIR=$LFS install
    rm -v $LFS/usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes,sframe}.{a,la}
}
