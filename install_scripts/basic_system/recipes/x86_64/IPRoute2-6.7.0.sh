#!/bin/bash
# package recipe for ferninux build
# rename this file as foo-[cfg]-version.sh
# arrays for download and build
unset DOWNLOAD_URLS
unset BUILD_DEPS
unset RUNTIME_DEPS
declare -A DOWNLOAD_URLS
declare -a BUILD_DEPS=()
declare -a RUNTIME_DEPS=()

src_file=$BASH_SOURCE

# package details
PACKAGE_NAME=iproute2
VERSION=$(echo ${src_file} | rev | cut -d '/' -f 1 | cut -d '-' -f 1 | cut -d '.' -f 2- | rev)
MD5_SUM="35d8277d1469596b7edc07a51470a033"
DOWNLOAD_URLS[$MD5_SUM]="https://www.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.7.0.tar.xz"
SRC_COMPRESSED_FILE=$(echo ${DOWNLOAD_URLS[$MD5_SUM]}  | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

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
