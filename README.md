# Ferninux

## Description
This project contains scripts and tools to create a raw disk image with a fully functional linux system, based on Linux From Scratch Project
***
## Prepare the env

Every time you want to use the project, change the env variables to your custom values in `set_env_vars.sh` and apply to the shell using `source`

`~$source set_env_vars.sh`

Theres two ways of execute the scripts, use root account (sourcing set_env_vars.sh) or `sudo -E script...`

Create a raw disk image with the partitions needed:

`script/create_env.sh`

Create a user to build temporary tools

`script/add_lfs_user.sh`

