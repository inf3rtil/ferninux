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
PACKAGE_NAME=iana-etc
VERSION=$(echo ${src_file} | rev | cut -d '/' -f 1 | cut -d '-' -f 1 | cut -d '.' -f 2- | rev)
MD5_SUM="aed66d04de615d76c70890233081e584"
DOWNLOAD_URLS[$MD5_SUM]="https://github.com/Mic92/iana-etc/releases/download/20240125/iana-etc-20240125.tar.gz"
SRC_COMPRESSED_FILE=$(echo ${DOWNLOAD_URLS[$MD5_SUM]}  | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

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
