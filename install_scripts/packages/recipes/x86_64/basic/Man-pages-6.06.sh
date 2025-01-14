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
PACKAGE_NAME=man-pages
VERSION=$(echo ${src_file} | rev | cut -d '/' -f 1 | cut -d '-' -f 1 | cut -d '.' -f 2- | rev)
MD5_SUM="26b39e38248144156d437e1e10cb20bf"
DOWNLOAD_URLS[$MD5_SUM]="https://www.kernel.org/pub/linux/docs/man-pages/man-pages-6.06.tar.xz"
SRC_COMPRESSED_FILE=$(echo ${DOWNLOAD_URLS[$MD5_SUM]}  | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

config_source_package(){
    rm -v man3/crypt*
}

build_source_package(){
    echo "no build required"
}

test_source_package(){
    echo "tests are not implemented for this package"
}

install_source_package(){
    make prefix=/usr install
}
