#!/bin/bash

if [[ $ENV_VARS_EXPORTED -ne 1 ]]; then
    echo "Env variables not found, probable solution:"
    echo "1 - source set_env_vars.sh"
    exit 1
fi

cd $LFS
mkdir -pv $BACKUP_DIR
tar -cvJpf $BACKUP_DIR/$BACKUP_FILE .
