#!/bin/bash

if [[ -z $ENV_VARS_EXPORTED ]]; then
    echo "Env variables not found, probable solutions:"
    echo "1 - source set_env_vars.sh"
    echo "2 - use sudo -E flag"
    exit 1
fi

declare -a download_list_files=()
download_list_files+=$WORK_DIR/util/download_urls/chroot_scripts

#wget --input-file=$WGET_FILE --continue --directory-prefix=$DOWNLOAD_DIR
wget --input-file=$WORK_DIR/util/download_urls/chroot_scripts --continue --directory-prefix=$DOWNLOAD_DIR

#pushd $DOWNLOAD_DIR
#  md5sum -c $CHECKSUM_FILE
#popd

$WORK_DIR/util/mount_devices.sh
mkdir -pv $LFS/sources
chmod -v a+wt $LFS/sources
cp -rv $DOWNLOAD_DIR/* $LFS/sources/

$WORK_DIR/util/umount_devices.sh
