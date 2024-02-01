#!/bin/bash

set -e

echo 11.3-systemd > /etc/lfs-release

cat > /etc/lsb-release << "EOF"
DISTRIB_ID="Linux From Scratch"
DISTRIB_RELEASE="11.3-systemd"
DISTRIB_CODENAME="ferninux"
DISTRIB_DESCRIPTION="Linux From Scratch"
EOF

cat > /etc/os-release << "EOF"
NAME="Linux From Scratch"
VERSION="11.3-systemd"
ID=lfs
PRETTY_NAME="Linux From Scratch 11.3-systemd"
VERSION_CODENAME="ffs"
EOF

file_list=(
 /etc/bashrc
 /etc/dircolors
 /etc/fstab
 /etc/hosts
 /etc/inputrc
 /etc/profile
 /etc/resolv.conf
 /etc/vimrc
 /root/.bash_profile
 /root/.bashrc
)

for file in "${file_list[@]}"
do
    if [ -e "$file" ]; then
	echo "$file found" 
        cat "$file"
    else
        echo "File $file not found."
	exit 1
    fi
done

echo "system OK, enjoy!"

