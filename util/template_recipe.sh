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
PACKAGE_NAME=
VERSION=$(echo ${src_file} | rev | cut -d '/' -f 1 | cut -d '-' -f 1 | cut -d '.' -f 2- | rev)
DOWNLOAD_URLS[""]=""
SRC_COMPRESSED_FILE=$(echo ${DOWNLOAD_URLS[""]}  | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

config_source_package(){

}

build_source_package(){
    make $MAKEFLAGS
}

install_source_package(){
    make install
}
