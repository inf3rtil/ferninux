#!/bin/bash


TEMP_FILE=xorg_libraries.txt
DOWNLOAD_URL_PREFIX="https://www.x.org/pub/individual/lib/"


cat > $TEMP_FILE << "EOF"
12344cd74a1eb25436ca6e6a2cf93097  xtrans-1.5.0.tar.xz
91752155473ef72a8b34523a65967e4d  libX11-1.8.6.tar.xz
964942427fcc5a9fa0539661421857c8  libXext-1.3.5.tar.xz
742863a552ecd53cdb957b7b276213cc  libFS-1.0.9.tar.xz
b444a0e4c2163d1bbc7b046c3653eb8d  libICE-1.1.1.tar.xz
ffa434ed96ccae45533b3d653300730e  libSM-1.2.4.tar.xz
e613751d38e13aa0d0fd8e0149cec057  libXScrnSaver-1.2.4.tar.xz
4ea21d3b5a36d93a2177d9abed2e54d4  libXt-1.3.0.tar.xz
ed52d396115fbc4d05300762aab79685  libXmu-1.1.4.tar.xz
5073cf59174a2cadde220187759b2e7c  libXpm-3.5.16.tar.xz
3f1e1052dbf3a2b8582ec24137e1fbd1  libXaw-1.0.15.tar.xz
65b9ba1e9ff3d16c4fa72915d4bb585a  libXfixes-6.0.1.tar.xz
af0a5f0abb5b55f8411cd738cf0e5259  libXcomposite-0.4.6.tar.xz
ebf7fb3241ec03e8a3b2af72f03b4631  libXrender-0.9.11.tar.xz
4cdd1886fe5cce6f68554296edb46db8  libXcursor-1.2.1.tar.xz
ca55d29fa0a8b5c4a89f609a7952ebf8  libXdamage-1.1.6.tar.xz
6d3f1b15bb5b0bb71ae9f0a5103c1fc4  libfontenc-1.1.7.tar.xz
c179daa707f5f432f1bc13977e5bb329  libXfont2-2.0.6.tar.xz
cea0a3304e47a841c90fbeeeb55329ee  libXft-2.3.8.tar.xz
89ac74ad6829c08d5c8ae8f48d363b06  libXi-1.8.1.tar.xz
228c877558c265d2f63c56a03f7d3f21  libXinerama-1.1.5.tar.xz
850cbc7c921c9d5d0135734b114ff6ac  libXrandr-1.5.3.tar.xz
66c9e9e01b0b53052bb1d02ebf8d7040  libXres-1.2.2.tar.xz
02f128fbf809aa9c50d6e54c8e57cb2e  libXtst-1.2.4.tar.xz
70bfdd14ca1a563c218794413f0c1f42  libXv-1.0.12.tar.xz
11a358e7229fa28dc9801c1e64fe2e18  libXvMC-1.0.13.tar.xz
74d1acf93b83abeb0954824da0ec400b  libXxf86dga-1.1.6.tar.xz
5b913dac587f2de17a02e17f9a44a75f  libXxf86vm-1.1.5.tar.xz
1466cf950c914ad2db1dbb76c9a724db  libpciaccess-0.17.tar.xz
8af2275955d40166bb647b14e4896ab1  libxkbfile-1.1.2.tar.xz
faa74f7483074ce7d4349e6bdc237497  libxshmfence-1.3.2.tar.xz
EOF

sources=$(grep -v '^#' $TEMP_FILE | awk '{print $2}' | cut -d '-' -f 1)

for i in $sources;
do 
    echo "recipes+=($i)"
    MD5=$(cat $TEMP_FILE | grep $i | cut -d ' ' -f 1)
    echo $MD5
    DOWNLOAD=$DOWNLOAD_URL_PREFIX$(cat $TEMP_FILE | grep $i | cut -d ' ' -f 3)
    echo $DOWNLOAD
    VERSION=$(cat $TEMP_FILE | grep $i | cut -d ' ' -f 3 | rev | cut -d '.' -f 3- | rev | cut -d '-' -f 2- )
    echo $VERSION
    cat > ./$i.sh << EOF
#!/bin/bash

PACKAGE_NAME="$i"
VERSION="$VERSION"
DOWNLOAD_URL="$DOWNLOAD"
MD5_SUM="$MD5"
SRC_COMPRESSED_FILE=\$(echo \$DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=\$PACKAGE_NAME-\$VERSION

build_source_package(){
	./configure \$XORG_PREFIX --docdir=\$XORG_PREFIX/share/doc/\$PACKAGE_NAME-\$VERSION
	make \$MAKEFLAGS
	make install
	/sbin/ldconfig
}
EOF
chmod a+x ./$1
done

rm $TEMP_FILE
