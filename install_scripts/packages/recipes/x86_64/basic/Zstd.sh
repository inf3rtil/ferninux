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
MD5_SUM="63251602329a106220e0a5ad26ba656f"
DOWNLOAD_URLS[$MD5_SUM]="https://github.com/facebook/zstd/releases/download/v1.5.5/zstd-1.5.5.tar.gz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    echo "no config"
}

build_source_package(){
    make prefix=/usr $MAKEFLAGS
}

test_source_package(){
    make check
}

install_source_package(){
    make prefix=/usr install
    rm -v /usr/lib/libzstd.a
}
