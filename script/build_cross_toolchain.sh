#!/bin/bash

set -e

if [[ $ENV_VARS_EXPORTED -ne 1 ]]; then
    echo "Env variables not found, probable solutions:"
    echo "1 - source set_env_vars.sh"
    exit 1
fi

if [[ $(whoami) != $LFS_USER ]]; then
    echo "run this script as $LFS_USER user"
    exit 1
fi

recipes=(
    binutils.sh
    gcc.sh
    linux_headers.sh
    glibc.sh
    libstdc++.sh
    m4.sh
    ncurses.sh
)

SCRIPT=$(realpath -s "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

CROSS_TOOLCHAIN_RECIPES=$SCRIPT_PATH/cross_toolchain
SOURCES_ROOT_DIR=$LFS/sources

cd $CROSS_TOOLCHAIN_RECIPES
echo $CROSS_TOOLCHAIN_SOURCES

for file in "${recipes[@]}"
do
    if [ -x "$file" ]; then
        . ./"$file"
	echo "extracting files from $file"
	tar xfv $SOURCES_ROOT_DIR/$SRC_COMPRESSED_FILE -C $SOURCES_ROOT_DIR
	cd $SOURCES_ROOT_DIR/$SRC_FOLDER
	build_source_package
	rm -rf $SOURCES_ROOT_DIR/$SRC_FOLDER
	cd $CROSS_TOOLCHAIN_RECIPES
    else
        echo "File $file is not executable."
    fi
done
