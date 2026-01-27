#!/bin/bash

# deprecated
if [[ $ENV_VARS_EXPORTED -ne 1 ]]; then
    echo "Env variables not found, probable solution:"
    echo "1 - source set_env_vars.sh"
    exit 1
fi

$WORK_DIR/util/mount_devices.sh

cd $LFS
mkdir -pv $BACKUP_DIR
tar -cvJpf $BACKUP_DIR/$BACKUP_FILE .

$WORK_DIR/util/umount_devices.sh
