#!/bin/bash


if [[ -z $ENV_VARS_EXPORTED ]]; then
    echo "Env variables not found, probable solutions:"
    echo "1 - source set_env_vars.sh"
    echo "2 - use sudo -E flag"
    exit 1
fi

# 1 - get download urls and checksum hash of all recipes
rm $TEMP/recipe_list.txt 2> /dev/null
rm $CHECKSUM_FILE 2> /dev/null

declare -a recipes_path=()
declare -a recipe_files=()
recipes_path+=($WORK_DIR/cross_toolchain/recipes)
#recipes_path+=($WORK_DIR/install_scripts/temp_tools/recipes)
#recipes_path+=($WORK_DIR/install_scripts/basic_system/recipes)
#recipes_path+=($WORK_DIR/install_scripts/packages/recipes)

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
	url="${DOWNLOAD_URLS[$md5]}"
	checksum=$md5
	echo "$url : $checksum"
	if [ ! -f $DOWNLOAD_DIR/$SRC_COMPRESSED_FILE ]; then
	    wget $url --continue --directory-prefix=$DOWNLOAD_DIR
	else
	    echo "file $SRC_COMPRESSED_FILE already retrieved"
	fi
	file=$(echo ${url} | rev | cut -d '/' -f 1 | rev)
	echo "$md5  $file" >> $CHECKSUM_FILE
    done
done < $TEMP/recipe_list.txt

# 3 - verify md5
pushd $DOWNLOAD_DIR
  md5sum -c $CHECKSUM_FILE
popd

# 4 - copy downloaded files to target
$WORK_DIR/util/mount_devices.sh
mkdir -pv $LFS/sources
chmod -v a+wt $LFS/sources
cp -r $DOWNLOAD_DIR/* $LFS/sources/
$WORK_DIR/util/umount_devices.sh
