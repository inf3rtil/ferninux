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
MD5_SUM="e170147da25e1d5f72721ffc46fe4e06"
DOWNLOAD_URLS[$MD5_SUM]="https://github.com/rhboot/efibootmgr/archive/18/efibootmgr-18.tar.gz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    echo "no config"
}

build_source_package(){
    make EFIDIR=LFS EFI_LOADER=grubx64.efi
}

test_source_package(){
    echo "tests are not implemented for this package"
}

install_source_package(){
    make install EFIDIR=LFS
}
