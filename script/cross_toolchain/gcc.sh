#!/bin/bash

SRC_COMPRESSED_FILE=gcc-12.2.0.tar.xz
SRC_FOLDER=gcc-12.2.0

build_source_package(){
    tar -xf ../mpfr-4.2.0.tar.xz && mv -v mpfr-4.2.0 mpfr
    tar -xf ../gmp-6.2.1.tar.xz && mv -v gmp-6.2.1 gmp
    tar -xf ../mpc-1.3.1.tar.gz && mv -v mpc-1.3.1 mpc
    case $(uname -m) in 
	x86_64) 
	    sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64
	    ;;
    esac
    mkdir -pv build && cd build
    ../configure \
	--target=$LFS_TGT \
	--prefix=$LFS/tools \
	--with-glibc-version=2.37 \
	--with-sysroot=$LFS \
	--with-newlib \
	--without-headers \
	--enable-default-pie \
	--enable-default-ssp \
	--disable-nls \
	--disable-shared \
	--disable-multilib \
	--disable-threads \
	--disable-libatomic \
	--disable-libgomp \
	--disable-libquadmath \
	--disable-libssp \
	--disable-libvtv \
	--disable-libstdcxx \
	--enable-languages=c,c++
    make $MAKEFLAGS
    make install
}

    
    
