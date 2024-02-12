#!/bin/bash

PACKAGE_NAME="kapidox"
VERSION="5.109.0"
DOWNLOAD_URL="https://download.kde.org/stable/frameworks/5.109/kapidox-5.109.0.tar.xz"
MD5_SUM="e4cc63aafbbe019ebb8d62f6c02e9d2e"
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    pip3 wheel -w dist --no-build-isolation --no-deps $PWD
    pip3 install --no-index --find-links dist --no-cache-dir --no-user kapidox
}
