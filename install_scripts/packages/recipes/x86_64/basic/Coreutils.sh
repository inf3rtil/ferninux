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
MD5_SUM="459e9546074db2834eefe5421f250025"
DOWNLOAD_URLS[$MD5_SUM]="https://ftp.gnu.org/gnu/coreutils/coreutils-9.4.tar.xz"
DOWNLOAD_URLS["cca7dc8c73147444e77bc45d210229bb"]="https://www.linuxfromscratch.org/patches/lfs/12.1/coreutils-9.4-i18n-1.patch"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    patch -Np1 -i ../../coreutils-9.4-i18n-1.patch
    sed -e '/n_out += n_hold/,+4 s|.*bufsize.*|//&|' \
	-i src/split.c
    autoreconf -fiv
    FORCE_UNSAFE_CONFIGURE=1 ./configure \
			     --prefix=/usr            \
			     --enable-no-install-program=kill,uptime
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    make NON_ROOT_USERNAME=tester check-root
    groupadd -g 102 dummy -U tester
    chown -R tester .
    su tester -c "PATH=$PATH make RUN_EXPENSIVE_TESTS=yes check"
    groupdel dummy
}

install_source_package(){
    make install
    mv -v /usr/bin/chroot /usr/sbin
    mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
    sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8
}
