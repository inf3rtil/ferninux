#!/bin/bash

# This script get url's and mds5 checksum from recipes
# download the packages, verify the md5 and store


if [[ -z $ENV_VARS_EXPORTED ]]; then
    echo "Env variables not found, probable solutions:"
    echo "1 - source set_env_vars.sh"
    echo "2 - use sudo -E flag"
    exit 1
fi

function create_download_list() {
    echo "Creating download list"
    rm $TEMP/recipe_list.txt | true
    declare -a recipes_path=()
    declare -a recipe_files=()
    recipes_path+=($WORK_DIR/cross_toolchain/recipes/$FERNINUX_TARGET_ARCH)
    recipes_path+=($WORK_DIR/install_scripts/temp_tools/recipes/$FERNINUX_TARGET_ARCH)
    recipes_path+=($WORK_DIR/install_scripts/packages/recipes/$FERNINUX_TARGET_ARCH/basic)

    for recipe_path in "${recipes_path[@]}"
    do
	echo "get recipe files from $recipe_path"
	find $recipe_path -name "*.sh" >> $TEMP/recipe_list.txt
    done
}



function copy_sources_to_disk() {
    mount_devices
    mkdir -pv $LFS/sources
    chmod -v a+wt $LFS/sources
    cp -vr $DOWNLOAD_DIR/* $LFS/sources/
    umount_devices
}



function download_sources() {
    rm $TEMP/checksum.md5 | true
    
    while read recipe; do
	. $recipe
	for md5 in "${!DOWNLOAD_URLS[@]}"
	do
	    if [[ -v SRC_COMPRESSED_FILE ]]; then
		url="${DOWNLOAD_URLS[$md5]}"
		echo "Get:$SRC_COMPRESSED_FILE"
		echo "From:$url"
		echo "MD5:$md5"
		url="${url/ftp.gnu.org/ftp.fau.de}"
		if [ ! -f $DOWNLOAD_DIR/$(basename ${url}) ]; then
		    wget -v --show-progress $url --continue --directory-prefix=$DOWNLOAD_DIR
		else
		    echo "file $SRC_COMPRESSED_FILE already retrieved"
		fi
		file=$(basename ${url})
		echo "$md5  $file" >> $TEMP/checksum.md5
	    fi
	done
    done < $TEMP/recipe_list.txt

    set -e

    pushd $DOWNLOAD_DIR
    md5sum -c $TEMP/checksum.md5
    popd

}
