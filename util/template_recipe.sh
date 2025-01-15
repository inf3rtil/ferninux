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
MD5_SUM=""
DOWNLOAD_URLS[$MD5_SUM]=""
SRC_COMPRESSED_FILE=$(echo ${DOWNLOAD_URLS[$MD5_SUM]}  | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$(echo ${SRC_COMPRESSED_FILE} | rev | cut -d '.' -f 3- | rev)

config_source_package(){

}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    echo "tests are not implemented for this package"
}

install_source_package(){
    make install
}
