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
MD5_SUM="c239213887804ba00654884918b37441"
DOWNLOAD_URLS[$MD5_SUM]="https://www.openssl.org/source/openssl-3.2.1.tar.gz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    ./config --prefix=/usr         \
             --openssldir=/etc/ssl \
             --libdir=lib          \
             shared                \
             zlib-dynamic
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    HARNESS_JOBS=$(nproc) make test
}

install_source_package(){
    sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
    make MANSUFFIX=ssl install
    mv -v /usr/share/doc/openssl /usr/share/doc/openssl-3.2.1
    cp -vfr doc/* /usr/share/doc/openssl-3.2.1
}
