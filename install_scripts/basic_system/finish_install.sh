#!/bin/bash

set -e

echo 12.0-systemd > /etc/lfs-release

cat > /etc/lsb-release << "EOF"
DISTRIB_ID="Linux From Scratch"
DISTRIB_RELEASE="12.0-systemd"
DISTRIB_CODENAME="ferninux"
DISTRIB_DESCRIPTION="Linux From Scratch"
EOF

cat > /etc/os-release << "EOF"
NAME="Linux From Scratch"
VERSION="12.0-systemd"
ID=lfs
PRETTY_NAME="Linux From Scratch 12.0-systemd"
VERSION_CODENAME="ferninux"
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
)

cd /

echo "Checking conf files"

for file in "${file_list[@]}"
do
    if [ -e "$file" ]; then
	echo "$file found" 
        cat "$file"
    else
        echo "File $file not found."
    fi
done

passwd

echo "Basic system OK, reboot and have fun!"

