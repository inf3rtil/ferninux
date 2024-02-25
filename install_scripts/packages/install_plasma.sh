#!/bin/bash

set -e
SCRIPT=$(realpath -s "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

. /script/install_source.sh

declare -a recipes=()
recipes+=(multimedia_libraries/libogg)
recipes+=(multimedia_libraries/libvorbis)
recipes+=(multimedia_libraries/libcanberra)
recipes+=(multimedia_libraries/pipewire)
recipes+=(multimedia_libraries/libsndfile)
recipes+=(multimedia_libraries/pulseaudio)
recipes+=(graphical_libraries/sassc)
recipes+=(multimedia_libraries/taglib)
recipes+=(network_libraries/libnl)
recipes+=(network_libraries/libpcap)
recipes+=(utilities/lm-sensors)
recipes+=(programming/pycairo)
recipes+=(graphical_libraries/lcms2)

recipes+=(plasma/kdecoration)
recipes+=(plasma/libkscreen)
recipes+=(plasma/libksysguard)
recipes+=(plasma/breeze)
recipes+=(plasma/breeze-gtk)
recipes+=(plasma/layer-shell-qt)
recipes+=(plasma/kscreenlocker)
recipes+=(plasma/oxygen)
recipes+=(plasma/kinfocenter)
recipes+=(plasma/kwin)
recipes+=(plasma/plasma-workspace)
recipes+=(plasma/plasma-disks)
recipes+=(plasma/bluedevil)
recipes+=(plasma/kde-gtk-config)
recipes+=(plasma/khotkeys)
recipes+=(plasma/kmenuedit)
recipes+=(plasma/kscreen)
recipes+=(plasma/kwallet-pam)
recipes+=(plasma/kwayland-integration)
recipes+=(plasma/kwrited)
recipes+=(plasma/milou)
recipes+=(plasma/plasma-nm)
recipes+=(plasma/plasma-pa)
recipes+=(plasma/plasma-workspace-wallpapers)
recipes+=(plasma/polkit-kde-agent-1)
recipes+=(plasma/powerdevil)
recipes+=(plasma/plasma-desktop)
recipes+=(plasma/kgamma5)
recipes+=(plasma/ksshaskpass)
recipes+=(plasma/sddm-kcm)
recipes+=(plasma/kactivitymanagerd)
recipes+=(plasma/plasma-integration)
recipes+=(plasma/xdg-desktop-portal-kde)
recipes+=(plasma/drkonqi)
recipes+=(plasma/plasma-vault)
recipes+=(plasma/plasma-browser-integration)
recipes+=(plasma/kde-cli-tools)
recipes+=(plasma/systemsettings)
recipes+=(plasma/plasma-thunderbolt)
recipes+=(plasma/plasma-firewall)
recipes+=(plasma/plasma-systemmonitor)
recipes+=(plasma/qqc2-breeze-style)
recipes+=(plasma/ksystemstats)
recipes+=(plasma/oxygen-sounds)
recipes+=(plasma/kdeplasma-addons)
#recipes+=(plasma/kpipewire) #require ffmpeg
recipes+=(plasma/plank-player)
recipes+=(plasma/plasma-bigscreen)
recipes+=(plasma/plasma-remotecontrollers)

install_package_list

cat > /etc/pam.d/kde << "EOF"
# Begin /etc/pam.d/kde

auth     requisite      pam_nologin.so
auth     required       pam_env.so

auth     required       pam_succeed_if.so uid >= 1000 quiet
auth     include        system-auth

account  include        system-account
password include        system-password
session  include        system-session

# End /etc/pam.d/kde
EOF

cat > /etc/pam.d/kde-np << "EOF"
# Begin /etc/pam.d/kde-np

auth     requisite      pam_nologin.so
auth     required       pam_env.so

auth     required       pam_succeed_if.so uid >= 1000 quiet
auth     required       pam_permit.so

account  include        system-account
password include        system-password
session  include        system-session

# End /etc/pam.d/kde-np
EOF

cat > /etc/pam.d/kscreensaver << "EOF"
# Begin /etc/pam.d/kscreensaver

auth    include system-auth
account include system-account

# End /etc/pam.d/kscreensaver
EOF
