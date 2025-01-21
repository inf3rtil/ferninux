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
MD5_SUM="8fe7227653f2fb9b1ffe7f9f2058998a"
DOWNLOAD_URLS[$MD5_SUM]="https://pypi.org/packages/source/M/MarkupSafe/MarkupSafe-2.1.5.tar.gz"
SRC_COMPRESSED_FILE=$(basename ${DOWNLOAD_URLS[$MD5_SUM]})
SRC_FOLDER=${SRC_COMPRESSED_FILE%.*.*}

config_source_package(){
    echo "no config"
}

build_source_package(){
    pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
}

test_source_package(){
    echo "tests are not implemented for this package"
}

install_source_package(){
    pip3 install --no-index --no-user --find-links dist Markupsafe
}
