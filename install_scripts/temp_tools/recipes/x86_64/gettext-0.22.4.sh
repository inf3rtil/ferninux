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
PACKAGE_NAME=gettext
VERSION=0.22.4
MD5_SUM="2d8507d003ef3ddd1c172707ffa97ed8"
DOWNLOAD_URLS[$MD5_SUM]="https://ftp.gnu.org/gnu/gettext/gettext-0.22.4.tar.xz"
SRC_COMPRESSED_FILE=$PACKAGE_NAME-$VERSION.tar.xz
SRC_FOLDER=$PACKAGE_NAME-$VERSION

config_source_package(){
    ./configure --disable-shared
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    echo "tests are not implemented for this package"
}

install_source_package(){
    cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin
}
