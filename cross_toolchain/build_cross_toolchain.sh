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
#recipes+=(gcc-pass1-13.2.0)
#recipes+=(linux_headers.sh)
#recipes+=(glibc.sh)
#recipes+=(libstdc++.sh)
#recipes+=(m4.sh)
#recipes+=(ncurses.sh)
#recipes+=(bash.sh)
#recipes+=(coreutils.sh)
#recipes+=(diffutils.sh)
#recipes+=(file.sh)
#recipes+=(findutils.sh)
#recipes+=(gawk.sh)
#recipes+=(grep.sh)
#recipes+=(gzip.sh)
#recipes+=(make.sh)
#recipes+=(patch.sh)
#recipes+=(sed.sh)
#recipes+=(tar.sh)
#recipes+=(xz.sh)
#recipes+=(binutils2.sh)
#recipes+=(gcc2.sh)

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


