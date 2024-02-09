#!/bin/bash


TEMP_FILE=xorg_fonts.txt
DOWNLOAD_URL_PREFIX="https://www.x.org/pub/individual/font/"


cat > $TEMP_FILE << "EOF"
ec6cea7a46c96ed6be431dfbbb78f366  font-util-1.4.0.tar.xz
357d91d87c5d5a1ac3ea4e6a6daf833d  encodings-1.0.7.tar.xz
79f4c023e27d1db1dfd90d041ce89835  font-alias-1.0.5.tar.xz
546d17feab30d4e3abcf332b454f58ed  font-adobe-utopia-type1-1.0.5.tar.xz
063bfa1456c8a68208bf96a33f472bb1  font-bh-ttf-1.0.4.tar.xz
51a17c981275439b85e15430a3d711ee  font-bh-type1-1.0.4.tar.xz
00f64a84b6c9886040241e081347a853  font-ibm-type1-1.0.4.tar.xz
fe972eaf13176fa9aa7e74a12ecc801a  font-misc-ethiopic-1.0.5.tar.xz
3b47fed2c032af3a32aad9acc1d25150  font-xfree86-type1-1.0.5.tar.xz
EOF

sources=$(grep -v '^#' $TEMP_FILE | awk '{print $2}' | cut -d '-' -f 1- | rev | cut -d '-' -f 2- | rev)

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
	/sbin/ldconfig
}
EOF
chmod a+x ./$1
done

rm $TEMP_FILE
