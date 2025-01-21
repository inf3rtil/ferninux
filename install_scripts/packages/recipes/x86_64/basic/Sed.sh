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
MD5_SUM="6aac9b2dbafcd5b7a67a8a9bcb8036c3"
DOWNLOAD_URLS[$MD5_SUM]="https://ftp.gnu.org/gnu/sed/sed-4.9.tar.xz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    ./configure --prefix=/usr
}

build_source_package(){
    make $MAKEFLAGS
    make html
}

test_source_package(){
    chown -R tester .
    su tester -c "PATH=$PATH make check"
}

install_source_package(){
    make install
    install -d -m755           /usr/share/doc/sed-4.9
    install -m644 doc/sed.html /usr/share/doc/sed-4.9
}
