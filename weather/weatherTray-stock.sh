#!/bin/bash

DIR=`dirname $0`

while true; do
    python2 $DIR/weathercli.py 10245 | xargs $DIR/buildIcon.sh 1>&2
    echo icon $DIR/icon.png
    sleep $((30*60))
done | ~/src/trayIcon/trayIcon
