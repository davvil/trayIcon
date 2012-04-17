#!/bin/bash

INSTALLDIR=$1
PREFIXDIR=$2

mkdir -p $INSTALLDIR/bin $INSTALLDIR/share/trayIcon/battery
sed "s:%PREFIXDIR%:$PREFIXDIR:g" batteryTray > $INSTALLDIR/bin/batteryTray
chmod a+x $INSTALLDIR/bin/batteryTray
cp -r icons $INSTALLDIR/share/trayIcon/battery
