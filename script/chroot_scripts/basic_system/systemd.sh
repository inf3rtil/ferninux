#!/bin/bash

SRC_COMPRESSED_FILE=systemd-254.tar.gz
SRC_FOLDER=systemd-254

build_source_package(){
    sed -i -e 's/GROUP="render"/GROUP="video"/' \
	-e 's/GROUP="sgx", //' rules.d/50-udev-default.rules.in
    mkdir -p build
    cd build

    meson setup \
	  --prefix=/usr                 \
	  --buildtype=release           \
	  -Ddefault-dnssec=no           \
	  -Dfirstboot=false             \
	  -Dinstall-tests=false         \
	  -Dldconfig=false              \
	  -Dsysusers=false              \
	  -Drpmmacrosdir=no             \
	  -Dhomed=false                 \
	  -Duserdb=false                \
	  -Dman=false                   \
	  -Dmode=release                \
	  -Dpamconfdir=no               \
	  -Ddev-kvm-mode=0660           \
	  -Ddocdir=/usr/share/doc/systemd-254 \
      ..
    ninja
    ninja install
    tar -xf ../../systemd-man-pages-254.tar.xz \
	--no-same-owner --strip-components=1   \
	-C /usr/share/man
    systemd-machine-id-setup
    systemctl preset-all
    systemctl disable systemd-sysupdate{,-reboot}
}

