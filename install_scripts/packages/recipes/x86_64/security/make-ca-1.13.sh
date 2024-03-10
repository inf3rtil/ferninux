#!/bin/bash
# package recipe for ferninux build
# rename this file as foo-[cfg]-version.sh
# arrays for download and build
unset DOWNLOAD_URLS
unset BUILD_DEPS
unset RUNTIME_DEPS
declare -A DOWNLOAD_URLS
declare -a BUILD_DEPS=()
BUILD_DEPS+=(security/libtasn1)
BUILD_DEPS+=(security/p11-kit)

declare -a RUNTIME_DEPS=()

src_file=$BASH_SOURCE

# package details
PACKAGE_NAME="make-ca"
VERSION=$(echo ${src_file} | rev | cut -d '/' -f 1 | cut -d '-' -f 1 | cut -d '.' -f 2- | rev)
MD5_SUM="04bd86fe2eb299788439c3466782ce45"
DOWNLOAD_URLS[$MD5_SUM]="https://github.com/lfs-book/make-ca/releases/download/v1.13/make-ca-1.13.tar.xz"
SRC_COMPRESSED_FILE=$(echo ${DOWNLOAD_URLS[$MD5_SUM]}  | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

config_source_package(){
    echo "no config"
}

build_source_package(){
    make install &&
	install -vdm755 /etc/ssl/local
}

test_source_package(){
    echo "tests are not implemented for this package"
}

install_source_package(){
    make install
    systemctl enable update-pki.timer
}
