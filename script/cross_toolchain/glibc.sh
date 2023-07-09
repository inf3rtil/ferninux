#!/bin/bash

SRC_COMPRESSED_FILE=glibc-2.37.tar.xz
SRC_FOLDER=glibc-2.37

build_source_package(){
    case $(uname -m) in
	i?86)
	    ln -sfv ld-linux.so.2 $LFS/lib/ld-lsb.so.3
	    ;;
	x86_64) ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64
		ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3
		;;
    esac
    patch -Np1 -i ../glibc-2.37-fhs-1.patch
    mkdir build
    cd build
    echo "rootsbindir=/usr/sbin" > configparms
    ../configure \
	--prefix=/usr \
	--host=$LFS_TGT \
	--build=$(../scripts/config.guess) \
	--enable-kernel=3.2 \
	--with-headers=$LFS/usr/include \
	libc_cv_slibdir=/usr/lib
    make -j1
    make DESTDIR=$LFS install
    sed '/RTLDLIST=/s@/usr@@g' -i $LFS/usr/bin/ldd
    $LFS/tools/libexec/gcc/$LFS_TGT/12.2.0/install-tools/mkheaders
    echo 'int main(){}' | $LFS_TGT-gcc -xc -
    readelf -l a.out | grep ld-linux
}
    
    
