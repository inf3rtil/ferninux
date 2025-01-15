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
PACKAGE_NAME=gcc
VERSION=$(echo ${src_file} | rev | cut -d '/' -f 1 | cut -d '-' -f 1 | cut -d '.' -f 2- | rev)
MD5_SUM="e0e48554cc6e4f261d55ddee9ab69075"
DOWNLOAD_URLS[$MD5_SUM]="https://ftp.gnu.org/gnu/gcc/gcc-$VERSION/gcc-$VERSION.tar.xz"
DOWNLOAD_URLS["523c50c6318dde6f9dc523bc0244690a"]="https://ftp.gnu.org/gnu/mpfr/mpfr-4.2.1.tar.xz"
DOWNLOAD_URLS["5c9bc658c9fd0f940e8e3e0f09530c62"]="https://ftp.gnu.org/gnu/mpc/mpc-1.3.1.tar.gz"
DOWNLOAD_URLS["956dc04e864001a9c22429f761f2c283"]="https://ftp.gnu.org/gnu/gmp/gmp-6.3.0.tar.xz"
SRC_COMPRESSED_FILE=$(echo ${DOWNLOAD_URLS[$MD5_SUM]}  | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

config_source_package(){
    tar -xf ../mpfr-4.2.1.tar.xz
    mv -v mpfr-4.2.1 mpfr
    tar -xf ../gmp-6.3.0.tar.xz
    mv -v gmp-6.3.0 gmp
    tar -xf ../mpc-1.3.1.tar.gz
    mv -v mpc-1.3.1 mpc
    case $(uname -m) in
	x86_64)
	    sed -e '/m64=/s/lib64/lib/' \
		-i.orig gcc/config/i386/t-linux64
	    ;;
    esac
    sed '/thread_header =/s/@.*@/gthr-posix.h/' \
	-i libgcc/Makefile.in libstdc++-v3/include/Makefile.in
    mkdir -v build
    cd       build
    ../configure                                       \
	--build=$(../config.guess)                     \
	--host=$LFS_TGT                                \
	--target=$LFS_TGT                              \
	LDFLAGS_FOR_TARGET=-L$PWD/$LFS_TGT/libgcc      \
	--prefix=/usr                                  \
	--with-build-sysroot=$LFS                      \
	--enable-default-pie                           \
	--enable-default-ssp                           \
	--disable-nls                                  \
	--disable-multilib                             \
	--disable-libatomic                            \
	--disable-libgomp                              \
	--disable-libquadmath                          \
	--disable-libsanitizer                         \
	--disable-libssp                               \
	--disable-libvtv                               \
	--enable-languages=c,c++
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    echo "tests are not implemented for this package"
}

install_source_package(){
    make DESTDIR=$LFS install
    ln -sv gcc $LFS/usr/bin/cc
}
