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
PACKAGE_NAME=e2fsprogs
VERSION=$(echo ${src_file} | rev | cut -d '/' -f 1 | cut -d '-' -f 1 | cut -d '.' -f 2- | rev)
MD5_SUM="6b4f18a33873623041857b4963641ee9"
DOWNLOAD_URLS[$MD5_SUM]="https://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v1.47.0/e2fsprogs-1.47.0.tar.gz"
SRC_COMPRESSED_FILE=$(echo ${DOWNLOAD_URLS[$MD5_SUM]}  | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

config_source_package(){
    mkdir -v build
    cd       build
    ../configure --prefix=/usr           \
		 --sysconfdir=/etc       \
		 --enable-elf-shlibs     \
		 --disable-libblkid      \
		 --disable-libuuid       \
		 --disable-uuidd         \
		 --disable-fsck
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    make check
}

install_source_package(){
    make install
    rm -fv /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a
    gunzip -v /usr/share/info/libext2fs.info.gz
    install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info
    makeinfo -o      doc/com_err.info ../lib/et/com_err.texinfo
    install -v -m644 doc/com_err.info /usr/share/info
    install-info --dir-file=/usr/share/info/dir /usr/share/info/com_err.info
}
