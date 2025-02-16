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
MD5_SUM="956dc04e864001a9c22429f761f2c283"
DOWNLOAD_URLS[$MD5_SUM]="https://ftp.gnu.org/gnu/gmp/gmp-6.3.0.tar.xz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    ./configure --prefix=/usr    \
		--enable-cxx     \
		--disable-static \
		--host=none-linux-gnu \
		--docdir=/usr/share/doc/gmp-6.3.0
}

test_source_package(){
    make check 2>&1 | tee gmp-check-log
    mkdir -pv /build_log/gmp
    cp gmp-check-log /build_log/gmp/
    awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log >>  /build_log/gmp/output.log
}

build_source_package(){
    make $MAKEFLAGS
    make html
    test_source_package
}

install_source_package(){
    make install
    make install-html
}
