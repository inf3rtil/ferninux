#!/bin/bash

set -e

. ./set_env_vars.sh

device=$(mount | grep $LFS | cut -d ' ' -f1)
echo "$device"
umount -v $device
losetup --verbose -D
losetup
