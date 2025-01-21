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
MD5_SUM="2882e3179748cc9f9c23ec593d6adc8d"
DOWNLOAD_URLS[$MD5_SUM]="https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    ./configure --prefix=/usr \
            --docdir=/usr/share/doc/flex-2.6.4 \
            --disable-static
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    make check
}

install_source_package(){
    make install
    ln -sv flex   /usr/bin/lex
    ln -sv flex.1 /usr/share/man/man1/lex.1
}
