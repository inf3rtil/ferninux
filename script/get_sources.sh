#!/bin/bash

. ./setup_env.sh

wget --input-file=$WGET_FILE --continue --directory-prefix=$LFS/sources

. ./umount_loop.sh
