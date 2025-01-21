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
MD5_SUM="aed66d04de615d76c70890233081e584"
DOWNLOAD_URLS[$MD5_SUM]="https://github.com/Mic92/iana-etc/releases/download/20240125/iana-etc-20240125.tar.gz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    echo "no config needed"
}

build_source_package(){
    echo "no build needed"
}

test_source_package(){
    echo "tests are not implemented for this package"
}

install_source_package(){
    cp services protocols /etc
}
