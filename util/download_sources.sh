#!/bin/bash

if [[ -z $ENV_VARS_EXPORTED ]]; then
    echo "Env variables not found, probable solutions:"
    echo "1 - source set_env_vars.sh"
    echo "2 - use sudo -E flag"
    exit 1
fi

declare -a recipes_path=()
declare -a recipe_files=()
recipes_path+=($WORK_DIR/install_scripts/temp_tools/recipes)
recipes_path+=($WORK_DIR/install_scripts/basic_system/recipes)
recipes_path+=($WORK_DIR/install_scripts/packages/recipes)

for recipe_path in "${recipes_path[@]}"
do
    echo "get recipe files from $recipe_path"
    find $recipe_path -name "*.sh" >> recipe_list.txt
done

while read recipe; do
    grep DOWNLOAD_URL*= "$recipe"
done < recipe_list.txt

#recipes

#wget --input-file=$WGET_FILE --continue --directory-prefix=$DOWNLOAD_DIR
#wget --input-file=$WORK_DIR/util/download_urls/chroot_scripts --continue --directory-prefix=$DOWNLOAD_DIR

#pushd $DOWNLOAD_DIR
#  md5sum -c $CHECKSUM_FILE
#popd

#$WORK_DIR/util/mount_devices.sh
#mkdir -pv $LFS/sources
#chmod -v a+wt $LFS/sources
#cp -r $DOWNLOAD_DIR/* $LFS/sources/

#$WORK_DIR/util/umount_devices.sh
