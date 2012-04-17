#!/bin/bash

INSTALLDIR=$1
PREFIXDIR=$2

mkdir -p $INSTALLDIR/share/trayIcon/layouts/icons
cp -r *.png $INSTALLDIR/share/trayIcon/layouts/icons
