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
MD5_SUM="e2fd7adccf6b1e98eb1ae8d5a1ce5762"
DOWNLOAD_URLS[$MD5_SUM]="https://www.kernel.org/pub/linux/utils/kbd/kbd-2.6.4.tar.xz"
DOWNLOAD_URLS["f75cca16a38da6caa7d52151f7136895"]="https://www.linuxfromscratch.org/patches/lfs/12.1/kbd-2.6.4-backspace-1.patch"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    patch -Np1 -i ../kbd-2.6.4-backspace-1.patch
    sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure
    sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in
    ./configure --prefix=/usr --disable-vlock
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    make check
}

install_source_package(){
    make install
    cp -R -v docs/doc -T /usr/share/doc/kbd-2.6.4
}
