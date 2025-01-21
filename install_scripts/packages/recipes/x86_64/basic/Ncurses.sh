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
MD5_SUM="c5367e829b6d9f3f97b280bb3e6bfbc3"
DOWNLOAD_URLS[$MD5_SUM]="https://anduin.linuxfromscratch.org/LFS/ncurses-6.4-20230520.tar.xz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    ./configure --prefix=/usr           \
		--mandir=/usr/share/man \
		--with-shared           \
		--without-debug         \
		--without-normal        \
		--with-cxx-shared       \
		--enable-pc-files       \
		--enable-widec          \
		--with-pkg-config-libdir=/usr/lib/pkgconfig
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    echo "tests are not implemented for this package"
}

install_source_package(){
    make DESTDIR=$PWD/dest install
    install -vm755 dest/usr/lib/libncursesw.so.6.4 /usr/lib
    rm -v  dest/usr/lib/libncursesw.so.6.4
    sed -e 's/^#if.*XOPEN.*$/#if 1/' \
	-i dest/usr/include/curses.h
    cp -av dest/* /
    for lib in ncurses form panel menu ; do
	ln -sfv lib${lib}w.so /usr/lib/lib${lib}.so
	ln -sfv ${lib}w.pc    /usr/lib/pkgconfig/${lib}.pc
    done
    ln -sfv libncursesw.so /usr/lib/libcurses.so
}
