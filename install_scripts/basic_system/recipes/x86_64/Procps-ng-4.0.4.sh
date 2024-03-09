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
PACKAGE_NAME=procps-ng
VERSION=$(echo ${src_file} | rev | cut -d '/' -f 1 | cut -d '-' -f 1 | cut -d '.' -f 2- | rev)
MD5_SUM="2f747fc7df8ccf402d03e375c565cf96"
DOWNLOAD_URLS[$MD5_SUM]="https://sourceforge.net/projects/procps-ng/files/Production/procps-ng-4.0.4.tar.xz"
SRC_COMPRESSED_FILE=$(echo ${DOWNLOAD_URLS[$MD5_SUM]}  | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

config_source_package(){
    ./configure --prefix=/usr                           \
		--docdir=/usr/share/doc/procps-ng-4.0.4 \
		--disable-static                        \
		--disable-kill                          \
		--with-systemd
}

build_source_package(){
    make $MAKEFLAGS src_w_LDADD='$(LDADD) -lsystemd'
}

test_source_package(){
    make -k check
}

install_source_package(){
    make install
}
