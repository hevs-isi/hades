#!/bin/bash
DIR=`mktemp -d`
DATE=`date -I`

cp -a hades-tools $DIR/hades-tools-$DATE
cat $DIR/hades-tools-$DATE/DEBIAN/control.in | sed -e "s/Version:/Version:$DATE/" > $DIR/hades-tools-$DATE/DEBIAN/control
dpkg-deb -b $DIR/hades-tools-$DATE
mv $DIR/hades-tools-$DATE.deb .
rm -r $DIR
