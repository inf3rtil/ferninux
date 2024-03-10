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
PACKAGE_NAME=kmod
VERSION=$(echo ${src_file} | rev | cut -d '/' -f 1 | cut -d '-' -f 1 | cut -d '.' -f 2- | rev)
MD5_SUM="6165867e1836d51795a11ea4762ff66a"
DOWNLOAD_URLS[$MD5_SUM]="https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-31.tar.xz"
SRC_COMPRESSED_FILE=$(echo ${DOWNLOAD_URLS[$MD5_SUM]}  | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

config_source_package(){
    ./configure --prefix=/usr          \
		--sysconfdir=/etc      \
		--with-openssl         \
		--with-xz              \
		--with-zstd            \
		--with-zlib
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    echo "tests are not implemented for this package"
}

install_source_package(){
    make install
    for target in depmod insmod modinfo modprobe rmmod; do
	ln -sfv ../bin/kmod /usr/sbin/$target
    done

    ln -sfv kmod /usr/bin/lsmod
}
