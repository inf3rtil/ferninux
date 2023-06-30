#!/bin/bash

. ./set_env_vars.sh

wget --input-file=$WGET_FILE --continue --directory-prefix=$LFS/sources
