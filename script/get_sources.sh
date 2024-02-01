#!/bin/bash

if [[ -z $ENV_VARS_EXPORTED ]]; then
    echo "Env variables not found, probable solutions:"
    echo "1 - source set_env_vars.sh"
    echo "2 - use sudo -E flag"
    exit 1
fi

cp -rp $WORK_DIR/sources/* $LFS/sources/  
#wget --input-file=$WGET_FILE --continue --directory-prefix=$LFS/sources

