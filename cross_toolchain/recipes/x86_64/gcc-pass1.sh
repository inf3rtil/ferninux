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
MD5_SUM="e0e48554cc6e4f261d55ddee9ab69075"
DOWNLOAD_URLS[$MD5_SUM]="https://ftp.gnu.org/gnu/gcc/gcc-13.2.0/gcc-13.2.0.tar.xz"
DOWNLOAD_URLS["523c50c6318dde6f9dc523bc0244690a"]="https://ftp.gnu.org/gnu/mpfr/mpfr-4.2.1.tar.xz"
DOWNLOAD_URLS["5c9bc658c9fd0f940e8e3e0f09530c62"]="https://ftp.gnu.org/gnu/mpc/mpc-1.3.1.tar.gz"
DOWNLOAD_URLS["956dc04e864001a9c22429f761f2c283"]="https://ftp.gnu.org/gnu/gmp/gmp-6.3.0.tar.xz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

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
    LFS_TGT=$(uname -m)-lfs-linux-gnu #FIX
    mkdir -v build
    cd       build
    ../configure                  \
    --target=$LFS_TGT         \
    --prefix=$LFS/tools       \
    --with-glibc-version=2.39 \
    --with-sysroot=$LFS       \
    --with-newlib             \
    --without-headers         \
    --enable-default-pie      \
    --enable-default-ssp      \
    --disable-nls             \
    --disable-shared          \
    --disable-multilib        \
    --disable-threads         \
    --disable-libatomic       \
    --disable-libgomp         \
    --disable-libquadmath     \
    --disable-libssp          \
    --disable-libvtv          \
    --disable-libstdcxx       \
    --enable-languages=c,c++
}

build_source_package(){
    make $MAKEFLAGS
}

install_source_package(){
    make install
    cd ..
    cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
	`dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/include/limits.h
}
