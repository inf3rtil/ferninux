#!/bin/bash

. $WORK_DIR/util/env/create_env.sh
. $WORK_DIR/util/env/add_lfs_user.sh
. $WORK_DIR/util/env/mount_devices.sh
. $WORK_DIR/util/env/umount_devices.sh
. $WORK_DIR/util/downloader/download_sources.sh
. $WORK_DIR/util/env/enter_chroot.sh
. $WORK_DIR/util/env/clean.sh
