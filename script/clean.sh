#!/bin/bash

. ./set_env_vars.sh

cd $WORK_DIR
losetup -D
rm -rf ./*.img
rm -rf ./lfs
