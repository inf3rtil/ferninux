#!/bin/bash


TEMP_FILE=plasma_packages.txt
DOWNLOAD_URL_PREFIX=https://download.kde.org/stable/plasma/5.27.7

cat > $TEMP_FILE << "EOF"
f8e36636128efc0172b0664df372f350  kdecoration-5.27.7.tar.xz
0f40e7e4ef0675cf06afc828c6056821  libkscreen-5.27.7.tar.xz
fdbbd274867d8013631eb66f889da983  libksysguard-5.27.7.tar.xz
6d0358ed7bbb27557c073cfce675120f  breeze-5.27.7.tar.xz
7dac534103b595e861fb923e0a46af8a  breeze-gtk-5.27.7.tar.xz
27839d93e7bf42bd8e6e9d822572a3d3  layer-shell-qt-5.27.7.tar.xz
56e13a523dc2b27dd2fe7d17cf87c427  kscreenlocker-5.27.7.tar.xz
1806b24c107c30a0144be0c58361c391  oxygen-5.27.7.tar.xz
b3b25a757de32befe4c282ebc9b928c3  kinfocenter-5.27.7.tar.xz
f992f11ed7704e94809f4a609b444074  kwin-5.27.7.tar.xz
5aa3a8e2e8c97b182cb15090f9149831  plasma-workspace-5.27.7.tar.xz
2b3c139e30eaaf4cf42706c9e6212ca5  plasma-disks-5.27.7.tar.xz
a347a0848863114e96ca25868b1d2483  bluedevil-5.27.7.tar.xz
77731f7530552c096785e938554c5c0e  kde-gtk-config-5.27.7.tar.xz
19a17f02655872c827380bd1fc485b50  khotkeys-5.27.7.tar.xz
4777cae88cb32e1dc77d6765f3cf17e3  kmenuedit-5.27.7.tar.xz
a9618c0aa86cf8d0186e146aef644cd7  kscreen-5.27.7.tar.xz
d75c043ef114b2b590f8ede12bb86a24  kwallet-pam-5.27.7.tar.xz
9c4ebb3d608c08c83b87a880b731ef11  kwayland-integration-5.27.7.tar.xz
2d04936cfcdb3da0ecab6b9c7f83339e  kwrited-5.27.7.tar.xz
ea10ad5ac86ad2a1f1c0dfdb28918ad8  milou-5.27.7.tar.xz
1640a01420f5885d87e55a3fc3ca8410  plasma-nm-5.27.7.tar.xz
24cdd5610e2b02c774486cdeaf0074f5  plasma-pa-5.27.7.tar.xz
4d941372e2a0ba9fe4a42a668dfd6aeb  plasma-workspace-wallpapers-5.27.7.tar.xz
003d40545b13d58a2fa024236c92c18f  polkit-kde-agent-1-5.27.7.tar.xz
2708af1b47a164321111220f3e3fb5f8  powerdevil-5.27.7.tar.xz
7f7d2bea26b4d825c9a6e8d57e400a4a  plasma-desktop-5.27.7.1.tar.xz
#b8f2c72d4d0ffd37573c1f949e8604aa  plasma-desktop-5.27.7.tar.xz
f66aefab6b7b3115ead7cf3966d6e2c6  kgamma5-5.27.7.tar.xz
614a24e70dfdcbf225047951d1bb35af  ksshaskpass-5.27.7.tar.xz
#8e9460adae337baab8d80da3422f9e34  plasma-sdk-5.27.7.1.tar.xz
#69bcb008dc0c22bb9dad2f990778b46e  plasma-sdk-5.27.7.5.27.7.1.tar.xz
#cba2b18c587dff393bd232d61a35046d  plasma-sdk-5.27.7.tar.xz
293fa8cd57834e07c719a055e2b47fbe  sddm-kcm-5.27.7.tar.xz
#7857d8972a9cc45cc3b672a6d5ff2b12  discover-5.27.7.tar.xz
#9727481d29a7468420cb1a37a0b36e9e  breeze-grub-5.27.7.tar.xz
#157416774eb4bfc57a4e2caf4512f069  breeze-plymouth-5.27.7.tar.xz
cdda9f9d374615768d8a324dae92ad1d  kactivitymanagerd-5.27.7.tar.xz
3e8fd694b222d4d6c3d4e2b952099fb0  plasma-integration-5.27.7.tar.xz
#7bd722f2799f4b1c562be46c5b2d0da1  plymouth-kcm-5.27.7.tar.xz
26e40eaf358dc02d71ab5cb511a5b3a8  xdg-desktop-portal-kde-5.27.7.tar.xz
ce2a9be64095829d124d4f83c14a464c  drkonqi-5.27.7.tar.xz
410818deea59fc12aa3ed155e350e931  plasma-vault-5.27.7.tar.xz
4636852897f802e64501fbae5e3dfb24  plasma-browser-integration-5.27.7.tar.xz
3febab89d2fca2e67271d5e35723d7be  kde-cli-tools-5.27.7.tar.xz
799ec2ab0012e47d2b1660affe5f333e  systemsettings-5.27.7.tar.xz
fa9f2208c27d8a3e99c0cbb113087338  plasma-thunderbolt-5.27.7.tar.xz
#c4dbf6737cc9d8d3396214d4bed14abf  plasma-nano-5.27.7.tar.xz
#74a1ec9c76b979fb8a3906204c93add4  plasma-mobile-5.27.7.tar.xz
ca0a794b2d65c9c763d0f932b2bd9c1e  plasma-firewall-5.27.7.tar.xz
4f3a9803e3741521b1867303b179670a  plasma-systemmonitor-5.27.7.tar.xz
29fb63dc5c266b3fe0a2e849f1a1db28  qqc2-breeze-style-5.27.7.tar.xz
2e3689a958a72aa1a09aa6edf471ce11  ksystemstats-5.27.7.tar.xz
08434c4829aefd689c877fe84baa5ad6  oxygen-sounds-5.27.7.tar.xz
#2b1b01328d062d6d9c3d92daaa26d13c  aura-browser-5.27.7.tar.xz
a32fedd93e3ecef504ea28ec27cbfd55  kdeplasma-addons-5.27.7.tar.xz
1d759ab0bb02f630385e4dc267aaef6e  kpipewire-5.27.7.tar.xz
553afd4e952b601147ca868b7129303d  plank-player-5.27.7.tar.xz
51ad32e45ad4a0f5291d1a9ce4efa0f2  plasma-bigscreen-5.27.7.tar.xz
fb25df16ef388f7dbfc163911e7828be  plasma-remotecontrollers-5.27.7.tar.xz
#507a8d13920b160b4683b093e90f6088  flatpak-kcm-5.27.7.tar.xz
#9eadbc5ec19e2122f81742e0f38941f7  plasma-welcome-5.27.7.tar.xz
EOF

sources=$(grep -v '^#' $TEMP_FILE | awk '{print $2}')

for i in $sources;
do
    PACKAGE_FILE=$(echo $i | cut -d '-' -f 1- | rev | cut -d '-' -f 2- | rev) 
    MD5=$(cat $TEMP_FILE | grep -w "$i" | cut -d ' ' -f 1)
    DOWNLOAD=$DOWNLOAD_URL_PREFIX/$(cat $TEMP_FILE | grep $i | cut -d ' ' -f 3)
    VERSION=$(echo $i | rev | cut -d '.' -f 3- | rev | rev |  cut -d '-' -f 1 | rev )
    #echo "recipes+=(plasma/$PACKAGE_FILE)"
    echo "$DOWNLOAD"
    cat > ./$PACKAGE_FILE.sh << EOF
#!/bin/bash

PACKAGE_NAME="$PACKAGE_FILE"
VERSION="$VERSION"
DOWNLOAD_URL="$DOWNLOAD"
MD5_SUM="$MD5"
SRC_COMPRESSED_FILE=\$(echo \$DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=\$PACKAGE_NAME-\$VERSION

build_source_package(){
       mkdir build
       cd    build

       cmake -DCMAKE_INSTALL_PREFIX=\$KF5_PREFIX \\
             -DCMAKE_BUILD_TYPE=Release         \\
             -DBUILD_TESTING=OFF                \\
             -Wno-dev ..  &&

        make \$MAKEFLAGS
        make install
	/sbin/ldconfig
}
EOF
chmod a+x ./$PACKAGE_FILE.sh
done

rm $TEMP_FILE
