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
MD5_SUM="89a8e82cfd2ad948b349c0a69c494463"
DOWNLOAD_URLS[$MD5_SUM]="https://cpan.metacpan.org/authors/id/T/TO/TODDR/XML-Parser-2.47.tar.gz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    perl Makefile.PL
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    make test
}

install_source_package(){
    make install
}
