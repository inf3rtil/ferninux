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
MD5_SUM="f3591e6970c017bb4bcd24ae762a98f5"
DOWNLOAD_URLS[$MD5_SUM]="https://www.kernel.org/pub/linux/utils/util-linux/v2.39/util-linux-2.39.3.tar.xz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    sed -i '/test_mkfds/s/^/#/' tests/helpers/Makemodule.am
    ./configure --bindir=/usr/bin    \
		--libdir=/usr/lib    \
		--runstatedir=/run   \
		--sbindir=/usr/sbin  \
		--disable-chfn-chsh  \
		--disable-login      \
		--disable-nologin    \
		--disable-su         \
		--disable-setpriv    \
		--disable-runuser    \
		--disable-pylibmount \
		--disable-static     \
		--without-python     \
		ADJTIME_PATH=/var/lib/hwclock/adjtime \
		--docdir=/usr/share/doc/util-linux-2.39.3
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
