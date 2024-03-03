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
recipes+=(binutils-pass1-2.42)
recipes+=(gcc-pass1-13.2.0)
recipes+=(linux-headers-6.7.4)
recipes+=(glibc-2.39)
recipes+=(libstdc++-13.2.0)
recipes+=(m4-1.4.19)
recipes+=(ncurses-6.4-20230520)
recipes+=(bash-5.2.21)
recipes+=(coreutils-9.4)
recipes+=(diffutils-3.10)
recipes+=(file-5.45)
recipes+=(findutils-4.9.0)
recipes+=(gawk-5.3.0)
recipes+=(grep-3.11)
recipes+=(gzip-1.13)
recipes+=(make-4.4.1)
recipes+=(patch-2.7.6)
recipes+=(sed-4.9)
recipes+=(tar-1.35)
recipes+=(xz-5.4.6)
recipes+=(binutils-pass2-2.42)
recipes+=(gcc-pass2-13.2.0)

# build cross compiler
for file in "${recipes[@]}"
do
    if [ -x "$file.sh" ]; then
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
    else
        echo "File $file is not executable."
	exit 1
    fi
done


