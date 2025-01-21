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
MD5_SUM="edd9928b4a3f82674bcc3551616eef3b"
DOWNLOAD_URLS[$MD5_SUM]="https://ftp.gnu.org/gnu/texinfo/texinfo-7.1.tar.xz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    ./configure --prefix=/usr
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    make check
}

install_source_package(){
    make install
    make TEXMF=/usr/share/texmf install-tex
    pushd /usr/share/info
    rm -v dir
    for f in *
    do install-info $f dir 2>/dev/null
    done
    popd
}
