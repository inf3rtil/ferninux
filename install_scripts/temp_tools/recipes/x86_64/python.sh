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
PACKAGE_NAME=Python
VERSION=3.12.2
MD5_SUM="e7c178b97bf8f7ccd677b94d614f7b3c"
DOWNLOAD_URLS[$MD5_SUM]="https://www.python.org/ftp/python/3.12.2/Python-3.12.2.tar.xz"
SRC_COMPRESSED_FILE=$PACKAGE_NAME-$VERSION.tar.xz
SRC_FOLDER=$PACKAGE_NAME-$VERSION

config_source_package(){
    ./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    echo "tests are not implemented for this package"
}

install_source_package(){
    make install
}
