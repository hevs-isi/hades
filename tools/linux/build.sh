#!/bin/bash
DIR=`mktemp -d`
DATE=`date -I`

cp -a hades-tools $DIR/hades-tools-$DATE
dpkg-deb -b $DIR/hades-tools-$DATE
mv $DIR/hades-tools-$DATE.deb .
rm -r $DIR
