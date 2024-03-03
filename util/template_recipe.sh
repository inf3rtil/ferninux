#!/bin/bash
# package recipe for ferninux build
# rename this file as foo-[cfg]-version.sh
# arrays for download and build
set ISRECIPE
unset DOWNLOAD_URLS
unset BUILD_DEPS
unset RUNTIME_DEPS
declare -A DOWNLOAD_URLS
declare -a BUILD_DEPS=()
declare -a RUNTIME_DEPS=()

# package details
PACKAGE_NAME=
VERSION=
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
