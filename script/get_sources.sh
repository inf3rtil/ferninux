#!/bin/bash

. ./set_env_vars.sh
. ./setup_env.sh

wget --input-file=$WGET_FILE --continue --directory-prefix=$LFS/sources
