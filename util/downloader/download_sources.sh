#!/bin/bash

# This script get url's and mds5 checksum from recipes
# download the packages, verify the md5 and store

if [[ -z $ENV_VARS_EXPORTED ]]; then
    echo "Env variables not found, probable solutions:"
    echo "1 - source set_env_vars.sh"
    echo "2 - use sudo -E flag"
    exit 1
fi

# 1 - get download urls and checksum hash of all recipes
# create 
rm $TEMP/recipe_list.txt 2> /dev/null
rm $TEMP/checksum.md5 2> /dev/null

declare -a recipes_path=()
declare -a recipe_files=()
recipes_path+=($WORK_DIR/cross_toolchain/recipes/$FERNINUX_TARGET_ARCH)
recipes_path+=($WORK_DIR/install_scripts/temp_tools/recipes/$FERNINUX_TARGET_ARCH)
recipes_path+=($WORK_DIR/install_scripts/packages/recipes/$FERNINUX_TARGET_ARCH)

for recipe_path in "${recipes_path[@]}"
do
    echo "get recipe files from $recipe_path"
    find $recipe_path -name "*.sh" >> $TEMP/recipe_list.txt
done

# 2 - download packages
while read recipe; do
    . $recipe
    for md5 in "${!DOWNLOAD_URLS[@]}"
    do
	checksum=$md5
	url="${DOWNLOAD_URLS[$checksum]}"
	compressed_file=$(echo ${url} | rev | cut -d '/' -f 1 | rev)
	echo "Url:$url"
	echo "File:$compressed_file"
	echo "MD5:$checksum"
	if [ ! -f $DOWNLOAD_DIR/$compressed_file ]; then
	    wget -q --show-progress $url --continue --directory-prefix=$DOWNLOAD_DIR
	else
	    echo "file $SRC_COMPRESSED_FILE already retrieved"
	fi
	file=$(echo ${url} | rev | cut -d '/' -f 1 | rev)
	echo "$md5  $file" >> $TEMP/checksum.md5
    done
done < $TEMP/recipe_list.txt

set -e

# 3 - verify md5
pushd $DOWNLOAD_DIR
  md5sum -c $TEMP/checksum.md5
popd

# 4 - copy downloaded files to root
$WORK_DIR/util/mount_devices.sh
mkdir -pv $LFS/sources
chmod -v a+wt $LFS/sources
cp -r $DOWNLOAD_DIR/* $LFS/sources/
$WORK_DIR/util/umount_devices.sh
