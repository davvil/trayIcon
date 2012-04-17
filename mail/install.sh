#!/bin/bash

INSTALLDIR=$1
mkdir -p $INSTALLDIR/bin $INSTALLDIR/share/trayIcon/mail/icons $INSTALLDIR/lib/trayIcon/mail
sed "s:%INSTALLDIR%:$INSTALLDIR:g" mailTray > $INSTALLDIR/bin/mailTray
chmod a+x $INSTALLDIR/bin/mailTray
sed "s:%INSTALLDIR%:$INSTALLDIR:g" imapTray.py > $INSTALLDIR/lib/trayIcon/mail/imapTray.py
cp -r mail-icon.png $INSTALLDIR/share/trayIcon/mail/icons
