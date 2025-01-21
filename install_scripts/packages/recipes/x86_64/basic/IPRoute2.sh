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
MD5_SUM="35d8277d1469596b7edc07a51470a033"
DOWNLOAD_URLS[$MD5_SUM]="https://www.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.7.0.tar.xz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    sed -i /ARPD/d Makefile
    rm -fv man/man8/arpd.8
}

build_source_package(){
    make $MAKEFLAGS NETNS_RUN_DIR=/run/netns
}

test_source_package(){
    echo "tests are not implemented for this package"
}

install_source_package(){
    make SBINDIR=/usr/sbin install
    mkdir -pv             /usr/share/doc/iproute2-6.7.0
    cp -v COPYING README* /usr/share/doc/iproute2-6.7.0
}
