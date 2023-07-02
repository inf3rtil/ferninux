#!/bin/bash

set -e

. ./set_env_vars.sh
. ./setup_env.sh

recipes=(
    binutils.sh
    gcc.sh)

CROSS_TOOLCHAIN_RECIPES=$PWD/cross_toolchain
SOURCES_ROOT_DIR=$LFS/sources
MAKEFLAGS="-j16"

cd $CROSS_TOOLCHAIN_RECIPES
echo $CROSS_TOOLCHAIN_SOURCES

for file in "${recipes[@]}"
do
    if [ -x "$file" ]; then
        . ./"$file"
	echo "extracting files from $file"
	tar xfv $SOURCES_ROOT_DIR/$SRC_COMPRESSED_FILE -C $SOURCES_ROOT_DIR
	cd $SOURCES_ROOT_DIR/$SRC_FOLDER
	eval "$PRE_BUILD"
	eval "$BUILD_CMD"
	eval "$INSTALL_CMD"
	rm -vrf $SOURCES_ROOT_DIR/$SRC_FOLDER
	cd $CROSS_TOOLCHAIN_RECIPES
    else
        echo "File $file is not executable."
    fi
done




