#!/bin/bash

set -e

SCRIPT=$(realpath -s "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

RECIPES_DIR=$SCRIPT_PATH/recipes/x86_64/xorg
SOURCES_ROOT_DIR=/sources

echo "Creating Xorg build env"
if test 1 -eq 0; then
export XORG_PREFIX=/usr
export XORG_CONFIG="--prefix=$XORG_PREFIX --sysconfdir=/etc \
    --localstatedir=/var --disable-static"

#if sudo installed
#cat > /etc/sudoers.d/xorg << EOF
#Defaults env_keep += XORG_PREFIX
#Defaults env_keep += XORG_CONFIG
#EOF

cat > /etc/profile.d/xorg.sh << EOF
XORG_PREFIX="$XORG_PREFIX"
XORG_CONFIG="--prefix=\$XORG_PREFIX --sysconfdir=/etc --localstatedir=/var --disable-static"
export XORG_PREFIX XORG_CONFIG
EOF
chmod 644 /etc/profile.d/xorg.sh
fi

declare -a recipes=()
recipes+=(util-macros)
recipes+=(xorgproto)
recipes+=(libXau)
recipes+=(libXdmcp)
recipes+=(xcb-proto)
recipes+=(libxcb)
recipes+=(Xorg Libraries)
recipes+=(Xorg Libraries)
recipes+=(libxcvt)
recipes+=(xcb-util)
recipes+=(xcb-util-image)
recipes+=(xcb-util-keysyms)
recipes+=(xcb-util-renderutil)
recipes+=(xcb-util-wm)
recipes+=(xcb-util-cursor)
recipes+=(Mesa)
recipes+=(xbitmaps)
recipes+=(Xorg Applications)
recipes+=(xcursor-themes)
recipes+=(Xorg Fonts)
recipes+=(XKeyboardConfig)
recipes+=(Xwayland)
recipes+=(Xorg-Server)
recipes+=(Xorg Input Drivers)
recipes+=(twm)
recipes+=(xterm)
recipes+=(xclock)
recipes+=(xinit)

cd $RECIPES_DIR

for file in "${recipes[@]}"
do
   #todo
done
