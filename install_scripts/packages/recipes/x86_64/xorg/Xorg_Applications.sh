#!/bin/bash


TEMP_FILE=xorg_applications.txt
DOWNLOAD_URL_PREFIX="https://www.x.org/pub/individual/app/"


cat > $TEMP_FILE << "EOF"
5d3feaa898875484b6b340b3888d49d8  iceauth-1.0.9.tar.xz
c4a3664e08e5a47c120ff9263ee2f20c  luit-1.1.1.tar.bz2
fd2e6e5a297ac2bf3d7d54799bf69de0  mkfontscale-1.2.2.tar.xz
05423bb42a006a6eb2c36ba10393de23  sessreg-1.1.3.tar.xz
1d61c9f4a3d1486eff575bf233e5776c  setxkbmap-1.3.4.tar.xz
9f7a4305f0e79d5a46c3c7d02df9437d  smproxy-1.0.7.tar.xz
e96b56756990c56c24d2d02c2964456b  x11perf-1.6.1.tar.bz2
dbcf944eb59343b84799b2cc70aace16  xauth-1.1.2.tar.xz
5b6405973db69c0443be2fba8e1a8ab7  xbacklight-1.2.3.tar.bz2
82a90e2feaeab5c5e7610420930cc0f4  xcmsdb-1.0.6.tar.xz
89e81a1c31e4a1fbd0e431425cd733d7  xcursorgen-1.0.8.tar.xz
933e6d65f96c890f8e96a9f21094f0de  xdpyinfo-1.3.4.tar.xz
34aff1f93fa54d6a64cbe4fee079e077  xdriinfo-1.0.7.tar.xz
61219e492511b3d78375da76defbdc97  xev-1.2.5.tar.xz
41afaa5a68cdd0de7e7ece4805a37f11  xgamma-1.0.7.tar.xz
48ac13856838d34f2e7fca8cdc1f1699  xhost-1.0.9.tar.xz
8e4d14823b7cbefe1581c398c6ab0035  xinput-1.6.4.tar.xz
a11d4d6eeda762f13818684c0670f89f  xkbcomp-1.4.6.tar.xz
05ce1abd8533a400572784b1186a44d0  xkbevd-1.1.5.tar.xz
cf65ca1aaf4c28772ca7993cfd122563  xkbutils-1.0.5.tar.xz
f62b99839249ce9a7a8bb71a5bab6f9d  xkill-1.0.6.tar.xz
da5b7a39702841281e1d86b7349a03ba  xlsatoms-1.1.4.tar.xz
ab4b3c47e848ba8c3e47c021230ab23a  xlsclients-1.1.5.tar.xz
f33841b022db1648c891fdc094014aee  xmessage-1.0.6.tar.xz
0d66e07595ea083871048c4b805d8b13  xmodmap-1.0.11.tar.xz
9cf272cba661f7acc35015f2be8077db  xpr-1.1.0.tar.xz
33c090d8632a300e63efbf36edd6a333  xprop-1.2.6.tar.xz
f822a8d5f233e609d27cc22d42a177cb  xrandr-1.5.2.tar.xz
c8629d5a0bc878d10ac49e1b290bf453  xrdb-1.2.2.tar.xz
33b04489e417d73c90295bd2a0781cbb  xrefresh-1.0.7.tar.xz
18ff5cdff59015722431d568a5c0bad2  xset-1.2.5.tar.xz
fa9a24fe5b1725c52a4566a62dd0a50d  xsetroot-1.1.3.tar.xz
d698862e9cad153c5fefca6eee964685  xvinfo-1.1.5.tar.xz
b0081fb92ae56510958024242ed1bc23  xwd-1.0.9.tar.xz
c91201bc1eb5e7b38933be8d0f7f16a8  xwininfo-1.1.6.tar.xz
5ff5dc120e8e927dc3c331c7fee33fc3  xwud-1.0.6.tar.xz
EOF

sources=$(grep -v '^#' $TEMP_FILE | awk '{print $2}' | cut -d '-' -f 1)

for i in $sources;
do 
    echo "recipes+=($i)"
    MD5=$(cat $TEMP_FILE | grep $i | cut -d ' ' -f 1)
    #echo $MD5
    DOWNLOAD=$DOWNLOAD_URL_PREFIX$(cat $TEMP_FILE | grep $i | cut -d ' ' -f 3)
    #echo $DOWNLOAD
    VERSION=$(cat $TEMP_FILE | grep $i | cut -d ' ' -f 3 | rev | cut -d '.' -f 3- | rev | cut -d '-' -f 2- )
    #echo $VERSION
    cat > ./$i.sh << EOF
#!/bin/bash

PACKAGE_NAME="$i"
VERSION="$VERSION"
DOWNLOAD_URL="$DOWNLOAD"
MD5_SUM="$MD5"
SRC_COMPRESSED_FILE=\$(echo \$DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=\$PACKAGE_NAME-\$VERSION

build_source_package(){
     ./configure \$XORG_CONFIG
     make \$MAKEFLAGS
     make install
}
EOF
chmod a+x ./$1
done

rm $TEMP_FILE
