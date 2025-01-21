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
MD5_SUM="370e1b6155ae63133380e421146619e0"
DOWNLOAD_URLS[$MD5_SUM]="https://www.kernel.org/pub/linux/kernel/v6.x/linux-6.7.4.tar.xz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    make mrproper
}

build_source_package(){
    make headers
    find usr/include -type f ! -name '*.h' -delete
}

install_source_package(){
    cp -rv usr/include $LFS/usr
}
