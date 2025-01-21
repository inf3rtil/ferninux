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
MD5_SUM="9e5a6dfd2d794dc056a770e8ad4a9263"
DOWNLOAD_URLS[$MD5_SUM]="https://ftp.gnu.org/gnu/inetutils/inetutils-2.5.tar.xz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    ./configure --prefix=/usr        \
		--bindir=/usr/bin    \
		--localstatedir=/var \
		--disable-logger     \
		--disable-whois      \
		--disable-rcp        \
		--disable-rexec      \
		--disable-rlogin     \
		--disable-rsh        \
		--disable-servers
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    make check
}

install_source_package(){
    make install
    mv -v /usr/{,s}bin/ifconfig
}
