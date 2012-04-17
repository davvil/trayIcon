#!/bin/bash

INSTALLDIR=$1
mkdir -p $INSTALLDIR/bin $INSTALLDIR/share/trayIcon/mail $INSTALLDIR/lib/trayIcon/weather/
sed "s:%INSTALLDIR%:$INSTALLDIR:g" weatherTray > $INSTALLDIR/bin/weatherTray
chmod a+x $INSTALLDIR/bin/weatherTray
cp weathercli.py weathercli-LICENSE weathercli-README.mkd $INSTALLDIR/lib/trayIcon/weather
cp -r icons $INSTALLDIR/share/trayIcon/weather
