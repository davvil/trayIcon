#!/bin/bash

INSTALLDIR=$1
PREFIXDIR=$2

mkdir -p $INSTALLDIR/bin $INSTALLDIR/share/trayIcon/weather $INSTALLDIR/lib/trayIcon/weather/ 
sed "s:%PREFIXDIR%:$PREFIXDIR:g" weatherTray > $INSTALLDIR/bin/weatherTray
chmod a+x $INSTALLDIR/bin/weatherTray
cp weathercli.py weathercli-LICENSE weathercli-README.mkd $INSTALLDIR/lib/trayIcon/weather
cp -r icons $INSTALLDIR/share/trayIcon/weather
