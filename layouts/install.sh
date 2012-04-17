#!/bin/bash

INSTALLDIR=$1
mkdir -p $INSTALLDIR/share/trayIcon/layouts/icons
cp -r *.png $INSTALLDIR/share/trayIcon/layouts/icons
