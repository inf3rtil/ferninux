#!/bin/bash

set -e

. ./set_env_vars.sh
#. ./setup_env.sh

CROSS_TOOLCHAIN_RECIPES=./cross_toolchain
SOURCES_ROOT_DIR=$LFS/sources

cd $CROSS_TOOLCHAIN_RECIPES
echo $CROSS_TOOLCHAIN_SOURCES

. ./binutils.sh

echo "extracting files"
tar xfv $SOURCES_ROOT_DIR/$SRC_COMPRESSED_FILE -C $SOURCES_ROOT_DIR

cd $SOURCES_ROOT_DIR/$SRC_FOLDER

eval "$PRE_BUILD"
eval "$BUILD_CMD"
eval "$INSTALL_CMD"
