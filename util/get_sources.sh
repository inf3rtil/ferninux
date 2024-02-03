#!/bin/bash

if [[ -z $ENV_VARS_EXPORTED ]]; then
    echo "Env variables not found, probable solutions:"
    echo "1 - source set_env_vars.sh"
    echo "2 - use sudo -E flag"
    exit 1
fi

$WORK_DIR/util/mount_devices.sh

wget --input-file=$WGET_FILE --continue --directory-prefix=$DOWNLOAD_DIR

pushd $DOWNLOAD_DIR
  md5sum -c $CHECKSUM_FILE
popd

mkdir -pv $LFS/sources
chmod -v a+wt $LFS/sources
cp -rv $DOWNLOAD_DIR/* $LFS/sources/

$WORK_DIR/util/umount_devices.sh
