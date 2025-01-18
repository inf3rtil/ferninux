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
PACKAGE_NAME=file
VERSION=$(echo ${src_file} | rev | cut -d '/' -f 1 | cut -d '-' -f 1 | cut -d '.' -f 2- | rev)
MD5_SUM="26b2a96d4e3a8938827a1e572afd527a"
DOWNLOAD_URLS[$MD5_SUM]="https://astron.com/pub/file/file-5.45.tar.gz"
SRC_COMPRESSED_FILE=$(echo ${DOWNLOAD_URLS[$MD5_SUM]}  | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

config_source_package(){
    mkdir build
    pushd build
    ../configure --disable-bzlib      \
		 --disable-libseccomp \
		 --disable-xzlib      \
		 --disable-zlib
    make
    popd
    ./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess)
}

build_source_package(){
    make FILE_COMPILE=$(pwd)/build/src/file $MAKEFLAGS
}

test_source_package(){
    echo "tests are not implemented for this package"
}

install_source_package(){
    make DESTDIR=$LFS install
    rm -v $LFS/usr/lib/libmagic.la
}
