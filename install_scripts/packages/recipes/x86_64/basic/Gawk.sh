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
MD5_SUM="97c5a7d83f91a7e1b2035ebbe6ac7abd"
DOWNLOAD_URLS[$MD5_SUM]="https://ftp.gnu.org/gnu/gawk/gawk-5.3.0.tar.xz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    sed -i 's/extras//' Makefile.in
    ./configure --prefix=/usr
}

build_source_package(){
    make $MAKEFLAGS
}

test_source_package(){
    chown -R tester .
    su tester -c "PATH=$PATH make check"
}

install_source_package(){
    rm -f /usr/bin/gawk-5.3.0
    make install
    ln -sv gawk.1 /usr/share/man/man1/awk.1
    mkdir -pv                                   /usr/share/doc/gawk-5.3.0
    cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-5.3.0
}
