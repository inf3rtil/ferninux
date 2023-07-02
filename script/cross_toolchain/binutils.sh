#!/bin/bash

SRC_COMPRESSED_FILE=binutils-2.40.tar.xz
SRC_FOLDER=binutils-2.40

PRE_BUILD="mkdir -pv build && cd build && \
../configure --prefix=$LFS/tools \
--with-sysroot=$LFS \
--target=$LFS_TGT \
--disable-nls \
--enable-gprofng=no \
--disable-werror"

BUILD_CMD="make $MAKEFLAGS"
POST_BUILD=""
INSTALL_CMD="make install"
POST_INSTALL=""

