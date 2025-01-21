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
MD5_SUM="e0e48554cc6e4f261d55ddee9ab69075"
DOWNLOAD_URLS[$MD5_SUM]="https://ftp.gnu.org/gnu/gcc/gcc-13.2.0/gcc-13.2.0.tar.xz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    case $(uname -m) in
	x86_64)
	    sed -e '/m64=/s/lib64/lib/' \
		-i.orig gcc/config/i386/t-linux64
	    ;;
    esac
    mkdir -v build
    cd       build
    ../configure --prefix=/usr            \
		 LD=ld                    \
		 --enable-languages=c,c++ \
		 --enable-default-pie     \
		 --enable-default-ssp     \
		 --disable-multilib       \
		 --disable-bootstrap      \
		 --disable-fixincludes    \
		 --with-system-zlib
}

test_source_package(){
    ulimit -s 32768
    chown -R tester .
    mkdir -pv /build_log/gcc
    su tester -c "PATH=$PATH make $MAKEFLAGS -k check"
    cp ../contrib/test_summary /build_log/gcc/
}

build_source_package(){
    make $MAKEFLAGS
    test_source_package
}

install_source_package(){
    make install
    chown -v -R root:root \
	  /usr/lib/gcc/$(gcc -dumpmachine)/13.2.0/include{,-fixed}
    ln -svr /usr/bin/cpp /usr/lib
    ln -sv gcc.1 /usr/share/man/man1/cc.1
    ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/13.2.0/liblto_plugin.so \
       /usr/lib/bfd-plugins/
    echo 'int main(){}' > dummy.c
    cc dummy.c -v -Wl,--verbose &> dummy.log
    readelf -l a.out | grep ': /lib' >> /build_log/gcc/compiler_test
    grep -E -o '/usr/lib.*/S?crt[1in].*succeeded' dummy.log >> /build_log/gcc/compiler_test
    grep -B4 '^ /usr/include' dummy.log >> /build_log/gcc/compiler_test
    grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g' >> /build_log/gcc/compiler_test
    grep "/lib.*/libc.so.6 " dummy.log >> /build_log/gcc/compiler_test
    grep found dummy.log >> /build_log/gcc/compiler_test
    cp dummy.log /build_log/gcc/
    rm -v dummy.c a.out dummy.log
    mkdir -pv /usr/share/gdb/auto-load/usr/lib
    mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib
}
