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
PACKAGE_NAME=texinfo
VERSION=7.1
MD5_SUM="edd9928b4a3f82674bcc3551616eef3b"
DOWNLOAD_URLS[$MD5_SUM]="https://ftp.gnu.org/gnu/texinfo/texinfo-7.1.tar.xz"
SRC_COMPRESSED_FILE=$PACKAGE_NAME-$VERSION.tar.xz
SRC_FOLDER=$PACKAGE_NAME-$VERSION

config_source_package(){
    ./configure --prefix=/usr
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
