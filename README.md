# Ferninux

## Description
This project contains scripts and tools to create a raw disk image with a fully functional linux system, based on Linux From Scratch Project
***
## Prepare the env

Every time you want to use the project, change the env variables to your custom values in `set_env_vars.sh` and apply to the shell using `source`

`~$source set_env_vars.sh`

Theres two ways of execute the scripts, use root account (sourcing set_env_vars.sh) or `sudo -E script...`

## 1 - Create a raw disk image with the partitions needed:

`util/create_env.sh`

## 2 - Create a user to build temporary tools

`util/add_lfs_user.sh`

## 3 - Download the sources

`util/get_sources.sh`

## 4 - Build Cross Toolchain (as lfs user)

`script/build_cross_toolchain.sh`

## 5 - Enter chroot

`util/enter_chroot.sh`

## 6 - Build entire system

`ferninux.sh`

## 7 - Exit chroot, and start a qemu vm with your new linux

`util/start_qemu.sh`
