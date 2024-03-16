#!/bin/bash

if [[ $ENV_VARS_EXPORTED -ne 1 ]]; then
    echo "Env variables not found, probable solutions:"
    echo "1 - source set_env_vars.sh"
    echo "2 - use sudo -E flag"
    exit 1
fi

losetup -D
rm -rfv $BUILD_DIR
if [[ $KEEP_DOWNLOAD_FILES -eq 0 ]]; then
    rm -rfv $DOWNLOAD_DIR
fi
rm -rfv $BACKUP_DIR
userdel $LFS_USER
