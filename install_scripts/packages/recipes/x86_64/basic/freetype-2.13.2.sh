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
PACKAGE_NAME=freetype
VERSION=$(echo ${src_file} | rev | cut -d '/' -f 1 | cut -d '-' -f 1 | cut -d '.' -f 2- | rev)
MD5_SUM="1f625f0a913c449551b1e3790a1817d7"
DOWNLOAD_URLS[$MD5_SUM]="https://downloads.sourceforge.net/freetype/freetype-2.13.2.tar.xz"
SRC_COMPRESSED_FILE=$(echo ${DOWNLOAD_URLS[$MD5_SUM]}  | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

config_source_package(){
    sed -ri "s:.*(AUX_MODULES.*valid):\1:" modules.cfg &&

	sed -r "s:.*(#.*SUBPIXEL_RENDERING) .*:\1:" \
	    -i include/freetype/config/ftoption.h  &&

	./configure --prefix=/usr --enable-freetype-config --disable-static
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
