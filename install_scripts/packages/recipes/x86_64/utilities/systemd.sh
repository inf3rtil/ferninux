#!/bin/bash

PACKAGE_NAME=systemd
VERSION=254
DOWNLOAD_URL=https://github.com/systemd/systemd/archive/v254/systemd-254.tar.gz
MD5_SUM=0d266e5361dc72097b6c18cfde1c0001
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    sed -i -e 's/GROUP="render"/GROUP="video"/' \
	-e 's/GROUP="sgx", //' rules.d/50-udev-default.rules.in
    mkdir build &&
	cd    build &&

	meson setup ..                \
	      --prefix=/usr           \
	      --buildtype=release     \
	      -Ddefault-dnssec=no     \
	      -Dfirstboot=false       \
	      -Dinstall-tests=false   \
	      -Dldconfig=false        \
	      -Dman=auto              \
	      -Dsysusers=false        \
	      -Drpmmacrosdir=no       \
	      -Dhomed=false           \
	      -Duserdb=false          \
	      -Dmode=release          \
	      -Dpam=true              \
	      -Dpamconfdir=/etc/pam.d \
	      -Ddev-kvm-mode=0660     \
	      -Ddocdir=/usr/share/doc/systemd-254 &&
	
	ninja
    ninja install
    grep 'pam_systemd' /etc/pam.d/system-session ||
cat >> /etc/pam.d/system-session << "EOF"
# Begin Systemd addition

session  required    pam_loginuid.so
session  optional    pam_systemd.so

# End Systemd addition
EOF

cat > /etc/pam.d/systemd-user << "EOF"
# Begin /etc/pam.d/systemd-user

account  required    pam_access.so
account  include     system-account

session  required    pam_env.so
session  required    pam_limits.so
session  required    pam_unix.so
session  required    pam_loginuid.so
session  optional    pam_keyinit.so force revoke
session  optional    pam_systemd.so

auth     required    pam_deny.so
password required    pam_deny.so

# End /etc/pam.d/systemd-user
EOF
}

