#!/bin/bash

INSTALLDIR=$1
PREFIXDIR=$2

mkdir -p $INSTALLDIR/bin $INSTALLDIR/share/trayIcon/mail/icons $INSTALLDIR/lib/trayIcon/mail
sed "s:%PREFIXDIR%:$PREFIXDIR:g" mailTray > $INSTALLDIR/bin/mailTray
chmod a+x $INSTALLDIR/bin/mailTray
sed "s:%PREFIXDIR%:$PREFIXDIR:g" imapTray.py > $INSTALLDIR/lib/trayIcon/mail/imapTray.py
cp -r mail-icon.png $INSTALLDIR/share/trayIcon/mail/icons
