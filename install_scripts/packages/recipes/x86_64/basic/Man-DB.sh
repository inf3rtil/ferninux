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
PACKAGE_NAME=man-db
VERSION=$(echo ${src_file} | rev | cut -d '/' -f 1 | cut -d '-' -f 1 | cut -d '.' -f 2- | rev)
MD5_SUM="67e0052fa200901b314fad7b68c9db27"
DOWNLOAD_URLS[$MD5_SUM]="https://download.savannah.gnu.org/releases/man-db/man-db-2.12.0.tar.xz"
SRC_COMPRESSED_FILE=$(echo ${DOWNLOAD_URLS[$MD5_SUM]}  | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

config_source_package(){
    ./configure --prefix=/usr                         \
		--docdir=/usr/share/doc/man-db-2.12.0 \
		--sysconfdir=/etc                     \
		--disable-setuid                      \
		--enable-cache-owner=bin              \
		--with-browser=/usr/bin/lynx          \
		--with-vgrind=/usr/bin/vgrind         \
		--with-grap=/usr/bin/grap
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    make check
}

install_source_package(){
    make install
}
