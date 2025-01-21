#!/bin/bash

# prepare env for build
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

SCRIPT=$(realpath -s "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")
CROSS_TOOLCHAIN_RECIPES=$SCRIPT_PATH/recipes/$FERNINUX_TARGET_ARCH
SOURCES_ROOT_DIR=$LFS/sources
cd $CROSS_TOOLCHAIN_RECIPES

# declare recipes
declare recipes=()
recipes+=(binutils-pass1)
recipes+=(gcc-pass1)
recipes+=(linux-headers)
recipes+=(glibc)
recipes+=(libstdc++)
recipes+=(m4)
recipes+=(ncurses)
recipes+=(bash)
recipes+=(coreutils)
recipes+=(diffutils)
recipes+=(file)
recipes+=(findutils)
recipes+=(gawk)
recipes+=(grep)
recipes+=(gzip)
recipes+=(make)
recipes+=(patch)
recipes+=(sed)
recipes+=(tar)
recipes+=(xz)
recipes+=(binutils-pass2)
recipes+=(gcc-pass2)

# build cross compiler
for file in "${recipes[@]}"
do
        . ./"$file.sh"
	echo "extracting files from $SRC_COMPRESSED_FILE"
	rm -rf $SOURCES_ROOT_DIR/$SRC_FOLDER
	tar xvf $SOURCES_ROOT_DIR/$SRC_COMPRESSED_FILE -C $SOURCES_ROOT_DIR
	cd $SOURCES_ROOT_DIR/$SRC_FOLDER
	config_source_package
	build_source_package
	install_source_package
	rm -rf $SOURCES_ROOT_DIR/$SRC_FOLDER
	cd $CROSS_TOOLCHAIN_RECIPES
done


