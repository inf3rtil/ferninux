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
PACKAGE_NAME=mandoc
VERSION=$(echo ${src_file} | rev | cut -d '/' -f 1 | cut -d '-' -f 1 | cut -d '.' -f 2- | rev)
MD5_SUM="f0adf24e8fdef5f3e332191f653e422a"
DOWNLOAD_URLS[$MD5_SUM]="https://mandoc.bsd.lv/snapshots/mandoc-1.14.6.tar.gz"
SRC_COMPRESSED_FILE=$(echo ${DOWNLOAD_URLS[$MD5_SUM]}  | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

config_source_package(){
    ./configure
}

build_source_package(){
    make $MAKEFLAGS mandoc
}

test_source_package(){
    echo "tests are not implemented for this package"
}

install_source_package(){
    install -vm755 mandoc   /usr/bin &&
	install -vm644 mandoc.1 /usr/share/man/man1
}
