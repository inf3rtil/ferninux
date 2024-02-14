#!/bin/bash

PACKAGE_NAME=docbook-xml
VERSION=4.5
DOWNLOAD_URL=docbook-xml-4.5.tar.gz
MD5_SUM=03083e288e87a7e829e437358da7ef9e
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    install -v -d -m755 /usr/share/xml/docbook/xml-dtd-4.5 &&
	install -v -d -m755 /etc/xml &&
	cp -v -af --no-preserve=ownership docbook.cat *.dtd ent/ *.mod \
	   /usr/share/xml/docbook/xml-dtd-4.5
    if [ ! -e /etc/xml/docbook ]; then
	xmlcatalog --noout --create /etc/xml/docbook
    fi &&
	xmlcatalog --noout --add "public" \
		   "-//OASIS//DTD DocBook XML V4.5//EN" \
		   "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd" \
		   /etc/xml/docbook &&
	xmlcatalog --noout --add "public" \
		   "-//OASIS//DTD DocBook XML CALS Table Model V4.5//EN" \
		   "file:///usr/share/xml/docbook/xml-dtd-4.5/calstblx.dtd" \
		   /etc/xml/docbook &&
	xmlcatalog --noout --add "public" \
		   "-//OASIS//DTD XML Exchange Table Model 19990315//EN" \
		   "file:///usr/share/xml/docbook/xml-dtd-4.5/soextblx.dtd" \
		   /etc/xml/docbook &&
	xmlcatalog --noout --add "public" \
		   "-//OASIS//ELEMENTS DocBook XML Information Pool V4.5//EN" \
		   "file:///usr/share/xml/docbook/xml-dtd-4.5/dbpoolx.mod" \
		   /etc/xml/docbook &&
	xmlcatalog --noout --add "public" \
		   "-//OASIS//ELEMENTS DocBook XML Document Hierarchy V4.5//EN" \
		   "file:///usr/share/xml/docbook/xml-dtd-4.5/dbhierx.mod" \
		   /etc/xml/docbook &&
	xmlcatalog --noout --add "public" \
		   "-//OASIS//ELEMENTS DocBook XML HTML Tables V4.5//EN" \
		   "file:///usr/share/xml/docbook/xml-dtd-4.5/htmltblx.mod" \
		   /etc/xml/docbook &&
	xmlcatalog --noout --add "public" \
		   "-//OASIS//ENTITIES DocBook XML Notations V4.5//EN" \
		   "file:///usr/share/xml/docbook/xml-dtd-4.5/dbnotnx.mod" \
		   /etc/xml/docbook &&
	xmlcatalog --noout --add "public" \
		   "-//OASIS//ENTITIES DocBook XML Character Entities V4.5//EN" \
		   "file:///usr/share/xml/docbook/xml-dtd-4.5/dbcentx.mod" \
		   /etc/xml/docbook &&
	xmlcatalog --noout --add "public" \
		   "-//OASIS//ENTITIES DocBook XML Additional General Entities V4.5//EN" \
		   "file:///usr/share/xml/docbook/xml-dtd-4.5/dbgenent.mod" \
		   /etc/xml/docbook &&
	xmlcatalog --noout --add "rewriteSystem" \
		   "http://www.oasis-open.org/docbook/xml/4.5" \
		   "file:///usr/share/xml/docbook/xml-dtd-4.5" \
		   /etc/xml/docbook &&
	xmlcatalog --noout --add "rewriteURI" \
		   "http://www.oasis-open.org/docbook/xml/4.5" \
		   "file:///usr/share/xml/docbook/xml-dtd-4.5" \
		   /etc/xml/docbook
    
    if [ ! -e /etc/xml/catalog ]; then
	xmlcatalog --noout --create /etc/xml/catalog
    fi &&
	xmlcatalog --noout --add "delegatePublic" \
		   "-//OASIS//ENTITIES DocBook XML" \
		   "file:///etc/xml/docbook" \
		   /etc/xml/catalog &&
	xmlcatalog --noout --add "delegatePublic" \
		   "-//OASIS//DTD DocBook XML" \
		   "file:///etc/xml/docbook" \
		   /etc/xml/catalog &&
	xmlcatalog --noout --add "delegateSystem" \
		   "http://www.oasis-open.org/docbook/" \
		   "file:///etc/xml/docbook" \
		   /etc/xml/catalog &&
	xmlcatalog --noout --add "delegateURI" \
		   "http://www.oasis-open.org/docbook/" \
		   "file:///etc/xml/docbook" \
		   /etc/xml/catalog
    
    for DTDVERSION in 4.1.2 4.2 4.3 4.4
    do
	xmlcatalog --noout --add "public" \
		   "-//OASIS//DTD DocBook XML V$DTDVERSION//EN" \
		   "http://www.oasis-open.org/docbook/xml/$DTDVERSION/docbookx.dtd" \
		   /etc/xml/docbook
	xmlcatalog --noout --add "rewriteSystem" \
		   "http://www.oasis-open.org/docbook/xml/$DTDVERSION" \
		   "file:///usr/share/xml/docbook/xml-dtd-4.5" \
		   /etc/xml/docbook
	xmlcatalog --noout --add "rewriteURI" \
		   "http://www.oasis-open.org/docbook/xml/$DTDVERSION" \
		   "file:///usr/share/xml/docbook/xml-dtd-4.5" \
		   /etc/xml/docbook
	xmlcatalog --noout --add "delegateSystem" \
		   "http://www.oasis-open.org/docbook/xml/$DTDVERSION/" \
		   "file:///etc/xml/docbook" \
		   /etc/xml/catalog
	xmlcatalog --noout --add "delegateURI" \
		   "http://www.oasis-open.org/docbook/xml/$DTDVERSION/" \
		   "file:///etc/xml/docbook" \
		   /etc/xml/catalog
    done
}

