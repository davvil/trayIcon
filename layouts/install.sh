#!/bin/bash

INSTALLDIR=$1
mkdir -p $INSTALLDIR/share/trayIcon/layouts/icons
cp -r * $INSTALLDIR/share/trayIcon/layouts/icons
