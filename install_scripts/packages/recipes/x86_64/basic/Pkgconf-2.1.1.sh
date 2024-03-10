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
PACKAGE_NAME=pkgconf
VERSION=$(echo ${src_file} | rev | cut -d '/' -f 1 | cut -d '-' -f 1 | cut -d '.' -f 2- | rev)
MD5_SUM="bc29d74c2483197deb9f1f3b414b7918"
DOWNLOAD_URLS[$MD5_SUM]="https://distfiles.ariadne.space/pkgconf/pkgconf-2.1.1.tar.xz"
SRC_COMPRESSED_FILE=$(echo ${DOWNLOAD_URLS[$MD5_SUM]}  | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

config_source_package(){
    ./configure --prefix=/usr              \
		--disable-static           \
		--docdir=/usr/share/doc/pkgconf-2.1.1
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    echo "tests are not implemented for this package"
}

install_source_package(){
    make install
    ln -sv pkgconf   /usr/bin/pkg-config
    ln -sv pkgconf.1 /usr/share/man/man1/pkg-config.1
}
