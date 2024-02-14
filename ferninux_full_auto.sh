#!/bin/bash

set -e

. set_env_vars.sh

$WORK_DIR/util/create_env.sh
$WORK_DIR/util/add_lfs_user.sh
$WORK_DIR/util/get_url_from_recipes.sh
$WORK_DIR/util/download_sources.sh
$WORK_DIR/util/mount_devices.sh
sudo --preserve-env=WORK_DIR,LFS_USER,ENV_VARS_EXPORTED,LFS,MAKEFLAGS,FERNINUX_TARGET_ARCH -u $LFS_USER \
     bash -c 'source ~/.bashrc && $WORK_DIR/cross_toolchain/build_cross_toolchain.sh'
$WORK_DIR/util/umount_devices.sh
$WORK_DIR/util/enter_chroot.sh
