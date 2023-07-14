#!/bin/bash

SRC_COMPRESSED_FILE=findutils-4.9.0.tar.xz
SRC_FOLDER=findutils-4.9.0

build_source_package(){
    case $(uname -m) in
	i?86) TIME_T_32_BIT_OK=yes ./configure --prefix=/usr --localstatedir=/var/lib/locate ;;
	x86_64) ./configure --prefix=/usr --localstatedir=/var/lib/locate ;;
    esac
    make $MAKEFLAGS
    make install
}

