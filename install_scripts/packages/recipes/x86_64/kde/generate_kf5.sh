#!/bin/bash


TEMP_FILE=kf5_packages.txt
DOWNLOAD_URL_PREFIX="https://download.kde.org/stable/frameworks/5.109"

cat > $TEMP_FILE << "EOF"
b025406c6818d92ad3fedd585bd8a428  attica-5.109.0.tar.xz
#0baf0a3ded2fed5e0442591dde276c4e  extra-cmake-modules-5.109.0.tar.xz
e4cc63aafbbe019ebb8d62f6c02e9d2e  kapidox-5.109.0.tar.xz
d096b76119d8d9da91fd112811d2b408  karchive-5.109.0.tar.xz
64087cda04bec6ad068f22ce1e3dcb1e  kcodecs-5.109.0.tar.xz
fe2b1c516c2f9caadd6c8e3bf35ffd96  kconfig-5.109.0.tar.xz
b88be3c775bef6277e047f09b531ba1d  kcoreaddons-5.109.0.tar.xz
5b00c0b729b5c11d2a5733ea7db5674f  kdbusaddons-5.109.0.tar.xz
993090bb9a0e678154382daa0626fa48  kdnssd-5.109.0.tar.xz
3fc1c5e58a8202cd0722aa7ec99ad584  kguiaddons-5.109.0.tar.xz
13b867e8189e91e402e5e9b9aa33b613  ki18n-5.109.0.tar.xz
d8f87c99c0b798f04ac328d7050d2d97  kidletime-5.109.0.tar.xz
777d46bc3c7c7e66804402220dac2df0  kimageformats-5.109.0.tar.xz
e3321430de25b4b16ad48c6c2f168170  kitemmodels-5.109.0.tar.xz
c5efe890400ab8b97270f9a3e821d510  kitemviews-5.109.0.tar.xz
f334911f97cd4592e3b823dfc518f9eb  kplotting-5.109.0.tar.xz
67f4605da5e119342e91fc4670114a2b  kwidgetsaddons-5.109.0.tar.xz
2b384fcad72c84ccda75f300c14f633c  kwindowsystem-5.109.0.tar.xz
4dcacee7da9987c587511634ca90f064  networkmanager-qt-5.109.0.tar.xz
8952c4756ed0bc072a8bad998ed81bc6  solid-5.109.0.tar.xz
8aff00ce75275252f45d915c478279de  sonnet-5.109.0.tar.xz
f98889ea3fa22aaeaa9f8a85a602f3a6  threadweaver-5.109.0.tar.xz
62195272670cdec8ceb0fbda4bd8c43b  kauth-5.109.0.tar.xz
9b99972d3a25f521c20c04d1867fc3dd  kcompletion-5.109.0.tar.xz
fc2f3a9c7d12066b659b46e13a75e97a  kcrash-5.109.0.tar.xz
43e0fddae05e83dfb7cd0b0bb5cc11e5  kdoctools-5.109.0.tar.xz
7ccb53e9023ada6a5e08e4d562769ef3  kpty-5.109.0.tar.xz
30d32d8dc23c6ad4915be89831238c54  kunitconversion-5.109.0.tar.xz
eb1a478738f8f5bd5ab7bd23145594b7  kconfigwidgets-5.109.0.tar.xz
2353574c0c41d1f9e274d29fc3f174c3  kservice-5.109.0.tar.xz
8f2118a5544acd0bcb9a2202180e1e27  kglobalaccel-5.109.0.tar.xz
f9ce944b2dcc815e8df677b7018530cd  kpackage-5.109.0.tar.xz
737509807d74878037d564ab19f8f4fb  kdesu-5.109.0.tar.xz
f8ec4f236ad6d229294003478b2c8660  kemoticons-5.109.0.tar.xz
8d23dcfeaa45d04f3a03b993794c1929  kiconthemes-5.109.0.tar.xz
b108a7c58d5e63248e4043a6e2d5cd3d  kjobwidgets-5.109.0.tar.xz
37840b5eff97d1cb6105a276a14f6982  knotifications-5.109.0.tar.xz
520e1568726e76671fdbc3c5180d1e12  ktextwidgets-5.109.0.tar.xz
d52b000182f1530befcb9023db853620  kxmlgui-5.109.0.tar.xz
e230f6ef16e636ed103bd30ee9256d9d  kbookmarks-5.109.0.tar.xz
fb90ee7dad377b5fe11cc5a60c0721c5  kwallet-5.109.0.tar.xz
ab29c38a4efbb1c2a8ae844aae1482ea  kded-5.109.0.tar.xz
73fc6504264e620b0f9d0ba96c9d8ca4  kio-5.109.0.tar.xz
1d180f9106dd4e55346bf6b68f144594  kdeclarative-5.109.0.tar.xz
a3a6afb25c9d4dd0b027468c318763cb  kcmutils-5.109.0.tar.xz
4f555c40672c66df4c6d685bee6c5ae1  kirigami2-5.109.0.tar.xz
f355ac0e56c60d258c242bb5115c5879  syndication-5.109.0.tar.xz
9d263510d765e23f80558e8c83b113fd  knewstuff-5.109.0.tar.xz
d3b4d1a97b4c724a99b9920f3931db58  frameworkintegration-5.109.0.tar.xz
3ecd4e79453f9a8b378b87a63a698280  kinit-5.109.0.tar.xz
b65f54d2f7b5c7b54926f147114c3ab4  kparts-5.109.0.tar.xz
7111af3ca1d17b3b085513bf4067557e  kactivities-5.109.0.tar.xz
#929785c0f7a5594f4eac30c2f40645d5  kdewebkit-5.109.0.tar.xz
e970abb368b963a075f10f2ef26a95c0  syntax-highlighting-5.109.0.tar.xz
9405ebf54d7c675a39ef00afc81e472d  ktexteditor-5.109.0.tar.xz
cd659fa310535c476d3dcb7cba5499f8  kdesignerplugin-5.109.0.tar.xz
b9ce7efb96ee1f88f3d8c505a3c8e8b1  kwayland-5.109.0.tar.xz
08ec7edef427f681dfb3b1533ab0d880  plasma-framework-5.109.0.tar.xz
5e66a95d9998d4874aa1d9004b2bdc50  modemmanager-qt-5.109.0.tar.xz
e66ebdbc5547881e8562bab6a02ce8bb  kpeople-5.109.0.tar.xz
a1af96f8f082e4f9fca0ce476528b6ae  kxmlrpcclient-5.109.0.tar.xz
91a2f23a8a88b7ac17c94f70b50a6b71  bluez-qt-5.109.0.tar.xz
c796f5097f2185c33a61d8e32a296066  kfilemetadata-5.109.0.tar.xz
2d0a01f671615c6a1559eaa4d73193c2  baloo-5.109.0.tar.xz
#40721040f8c42a60450a94b7975d18e3  breeze-icons-5.109.0.tar.xz
#cb7872cff65fe1f62815339f40c639d8  oxygen-icons5-5.109.0.tar.xz
f09fd15d79bca7374094ea1126e6aef6  kactivities-stats-5.109.0.tar.xz
7c7a7502b568b7c3c45f7c43cefa92e7  krunner-5.109.0.tar.xz
00d1282f4dd770085cf2d72371cd3388  prison-5.109.0.tar.xz
12f3d0a80404bcd1111f5164d8e9dfd0  qqc2-desktop-style-5.109.0.tar.xz
4ca7a857b39d805ba61c94d17cbe6862  kjs-5.109.0.tar.xz
06545a811be0293dc9a79d65ce265a4e  kdelibs4support-5.109.0.tar.xz
2c1d3e7d57e6793e7bfbcd7424a199bc  khtml-5.109.0.tar.xz
b9ab15ac90dece7fa6b623be95ef40f9  kjsembed-5.109.0.tar.xz
405558700e5518f7e25eb252c0027410  kmediaplayer-5.109.0.tar.xz
e647b806ba546ea010b304f707a9d696  kross-5.109.0.tar.xz
0fc9e9fda1d3a55fd61f655a1dec0b39  kholidays-5.109.0.tar.xz
08946785eb0fa4a3d5b1ac174433f9a7  purpose-5.109.0.tar.xz
c4faaf8fa6587a0b80a0618810e9d41a  kcalendarcore-5.109.0.tar.xz
588289805cb18731d9b73ea86236b458  kcontacts-5.109.0.tar.xz
08b2dcd842dfcda7e406d16646b082bb  kquickcharts-5.109.0.tar.xz
8612d9d00ff9daeb507548ed9150d00d  knotifyconfig-5.109.0.tar.xz
d4e4e96920394601cf599ed8e36bd635  kdav-5.109.0.tar.xz
EOF

sources=$(grep -v '^#' $TEMP_FILE | awk '{print $2}')

for i in $sources;
do
    PACKAGE_FILE=$(echo $i | cut -d '-' -f 1- | rev | cut -d '-' -f 2- | rev) 
    MD5=$(cat $TEMP_FILE | grep -w "$i" | cut -d ' ' -f 1)
    DOWNLOAD=$DOWNLOAD_URL_PREFIX/$(cat $TEMP_FILE | grep $i | cut -d ' ' -f 3)
    VERSION=$(echo $i | rev | cut -d '.' -f 3- | rev | rev |  cut -d '-' -f 1 | rev )
    echo "recipes+=(kde/$PACKAGE_FILE) $VERSION $MD5 $DOWNLOAD "
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
   cd build
   cmake -DCMAKE_INSTALL_PREFIX=\$KF5_PREFIX      \\
              -DCMAKE_PREFIX_PATH=\$QT5DIR         \\
              -DCMAKE_BUILD_TYPE=Release          \\
              -DBUILD_TESTING=OFF                 \\
              -Wno-dev ..
      make \$MAKEFLAGS
      make install
      /sbin/ldconfig
}
EOF
chmod a+x ./$PACKAGE_FILE.sh
done

rm $TEMP_FILE
