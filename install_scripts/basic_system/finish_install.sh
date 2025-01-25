#!/bin/bash

set -e

echo 12.0-systemd > /etc/lfs-release

cat > /etc/lsb-release << "EOF"
DISTRIB_ID="Ferninux"
DISTRIB_RELEASE="1.0-systemd"
DISTRIB_CODENAME="ferninux"
DISTRIB_DESCRIPTION="Ferninux"
EOF

cat > /etc/os-release << "EOF"
NAME="Ferninux"
VERSION="1.0-systemd"
ID=ferninux
PRETTY_NAME="Ferninux LFS based 1.0-systemd"
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

