#!/bin/bash

SRC_COMPRESSED_FILE=linux-6.4.12.tar.xz
SRC_FOLDER=linux-6.4.12

build_source_package(){
    make mrproper
    make headers
    find usr/include -type f ! -name '*.h' -delete
    cp -rv usr/include $LFS/usr
}
