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
MD5_SUM="4667bacb837f9ac4adb4a1a0266f4b65"
DOWNLOAD_URLS[$MD5_SUM]="https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.69.tar.xz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    sed -i '/install -m.*STA/d' libcap/Makefile
}

build_source_package(){
    make prefix=/usr lib=lib $MAKEFLAGS
}

test_source_package(){
    make test
}

install_source_package(){
    make prefix=/usr lib=lib install
}
