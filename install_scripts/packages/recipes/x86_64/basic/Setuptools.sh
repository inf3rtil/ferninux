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
MD5_SUM="6f6eb780ce12c90d81ce243747ed7ab0"
DOWNLOAD_URLS[$MD5_SUM]="https://pypi.org/packages/source/s/setuptools/setuptools-69.1.0.tar.gz"
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
    pip3 install --no-index --find-links dist setuptools
}
