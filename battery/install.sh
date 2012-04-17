#!/bin/bash

INSTALLDIR=$1
mkdir -p $INSTALLDIR/bin $INSTALLDIR/share/trayIcon/battery
sed "s:%INSTALLDIR%:$INSTALLDIR:g" batteryTray > $INSTALLDIR/bin/batteryTray
chmod a+x $INSTALLDIR/bin/batteryTray
cp -r icons $INSTALLDIR/share/trayIcon/battery
