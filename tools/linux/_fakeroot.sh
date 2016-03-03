#!/bin/bash
rm $1/DEBIAN/control.in
chmod -R 0755 $1/usr/
chmod -R 0644 $1/usr/share/applications/*
dpkg-deb -b $1
