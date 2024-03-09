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
PACKAGE_NAME=wheel
VERSION=$(echo ${src_file} | rev | cut -d '/' -f 1 | cut -d '-' -f 1 | cut -d '.' -f 2- | rev)
MD5_SUM="802ad6e5f9336fcb1c76b7593f0cd22d"
DOWNLOAD_URLS[$MD5_SUM]="https://pypi.org/packages/source/w/wheel/wheel-0.42.0.tar.gz"
SRC_COMPRESSED_FILE=$(echo ${DOWNLOAD_URLS[$MD5_SUM]}  | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

config_source_package(){
    echo "no config"
}

build_source_package(){
    pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
}

test_source_package(){
    echo "tests are not implemented for this package"
}

install_source_package(){
    pip3 install --no-index --find-links=dist wheel
}
