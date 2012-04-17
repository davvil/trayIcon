#!/bin/bash

INSTALLDIR=$1

if [ "$INSTALLDIR" == "" ]; then
    echo "Usage: `basename $0` <INSTALLDIR>" 1>&2
    exit 1
fi

mkdir -p $INSTALLDIR/bin
cp trayIcon $INSTALLDIR/bin
for i in battery layouts mail weather; do
    cd $i
    ./install.sh $INSTALLDIR
    cd ..
done
