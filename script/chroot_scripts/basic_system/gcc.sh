#!/bin/bash

SRC_COMPRESSED_FILE=gcc-12.2.0.tar.xz
SRC_FOLDER=gcc-12.2.0

build_source_package(){
    case $(uname -m) in
	x86_64)
	    sed -e '/m64=/s/lib64/lib/' \
		-i.orig gcc/config/i386/t-linux64
	    ;;
    esac
    mkdir build
    cd build
    ../configure --prefix=/usr \
		 LD=ld \
		 --enable-languages=c,c++ \
		 --enable-default-pie \
		 --enable-default-ssp \
		 --disable-multilib \
		 --disable-bootstrap \
		 --with-system-zlib
    make $MAKEFLAGS
    ulimit -s 32768
    chown -Rv tester .
   # su tester -c "PATH=$PATH make -k check"
    ../contrib/test_summary
    make install
    chown -v -R root:root \
	  /usr/lib/gcc/$(gcc -dumpmachine)/12.2.0/include{,-fixed}
    ln -svr /usr/bin/cpp /usr/lib
    ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/12.2.0/liblto_plugin.so \
       /usr/lib/bfd-plugins/
    echo 'int main(){}' > dummy.c
    cc dummy.c -v -Wl,--verbose &> dummy.log
    readelf -l a.out | grep ': /lib'
    grep -E -o '/usr/lib.*/S?crt[1in].*succeeded' dummy.log
    grep -B4 '^ /usr/include' dummy.log
    grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'
    grep "/lib.*/libc.so.6 " dummy.log
    grep found dummy.log
    rm -v dummy.c a.out dummy.log
    mkdir -pv /usr/share/gdb/auto-load/usr/lib
    mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib
    
}

