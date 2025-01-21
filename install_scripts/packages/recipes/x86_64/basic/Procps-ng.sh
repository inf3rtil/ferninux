#!/bin/bash
# package recipe for ferninux build
# rename this file as foo-[cfg].sh

# arrays for download and build
unset DOWNLOAD_URLS
unset BUILD_DEPS
unset RUNTIME_DEPS
declare -A DOWNLOAD_URLS
declare -a BUILD_DEPS=()
declare -a RUNTIME_DEPS=()

# package details
MD5_SUM="2f747fc7df8ccf402d03e375c565cf96"
DOWNLOAD_URLS[$MD5_SUM]="https://sourceforge.net/projects/procps-ng/files/Production/procps-ng-4.0.4.tar.xz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

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
