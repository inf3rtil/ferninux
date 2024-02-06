# Ferninux

## Description
This project contains scripts and tools to create a raw disk image with a fully functional linux system, based on Linux From Scratch Project and deployable on a virtualmachione or a physical disk drive
- 100% shell script
- minimal config for linux 6.4
- UEFI support by default
- fully customizable by editing set_env_vars.sh file and build recipes
- build based on single recipes

***
## Main setup
![menu](https://github.com/feferreira/ferninux/assets/8690564/72fb425b-d946-4afa-8922-4452b097dbc3)

## Final System
![linux](https://github.com/feferreira/ferninux/assets/8690564/9548fca6-8271-4b23-ac3a-05176303ee50)

## 1 - Create Project
- Create raw disk image with partitions and filesystem
- Download required sources
- Add special user to build cross toolchain

## 2 - Build Cross-Toolchain
- Build GCC as special user with a clean env

## 3 - Build Linux system
- chroot into virtual image
- build temporary tools
- build basic system
- build Linux kernel
- deploy baisc system config files
- install GRUB

## 4 - Start QEMU
- run a virtual machine to test new system

## 5 - Write image to disk
- dump the virtual disk image to a physical disk

## 6 - Clear Project
- remove all created files
