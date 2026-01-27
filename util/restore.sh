#!/bin/bash

# deprecated

if [[ $ENV_VARS_EXPORTED -ne 1 ]]; then
    echo "Env variables not found, probable solution:"
    echo "1 - source set_env_vars.sh"
    exit 1
fi

cd $LFS
rm -vrf ./*
tar -xvpf $BACKUP_DIR/$BACKUP_FILE
