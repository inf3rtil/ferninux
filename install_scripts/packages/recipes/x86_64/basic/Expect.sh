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
MD5_SUM="00fce8de158422f5ccd2666512329bd2"
DOWNLOAD_URLS[$MD5_SUM]="https://prdownloads.sourceforge.net/expect/expect5.45.4.tar.gz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    python3 -c 'from pty import spawn; spawn(["echo", "ok"])'
    ./configure --prefix=/usr           \
		--with-tcl=/usr/lib     \
		--enable-shared         \
		--mandir=/usr/share/man \
		--with-tclinclude=/usr/include
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    make test
}

install_source_package(){
    make install
    ln -svf expect5.45.4/libexpect5.45.4.so /usr/lib
}
