#!/bin/bash

set -e

echo 12.0-systemd > /etc/lfs-release


cat > /etc/lsb-release << "EOF"
DISTRIB_ID="Linux From Scratch"
DISTRIB_RELEASE="12.0-systemd"
DISTRIB_CODENAME="<your name here>"
DISTRIB_DESCRIPTION="Linux From Scratch"
EOF

cat > /etc/os-release << "EOF"
NAME="Linux From Scratch"
VERSION="12.0-systemd"
ID=lfs
PRETTY_NAME="Linux From Scratch 12.0-systemd"
VERSION_CODENAME="ferninux"
EOF

passwd root

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

cd /

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

echo "system OK, reboot and have fun!"

