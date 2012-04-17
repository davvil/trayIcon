#!/bin/bash

INSTALLDIR=$1
PREFIXDIR=$2

if [ "$INSTALLDIR" == "" ]; then
    echo "Usage: `basename $0` <INSTALLDIR> [<PREFIXDIR>]" 1>&2
    exit 1
fi

if [ "$PREFIXDIR" == "" ]; then
    PREFIXDIR=$INSTALLDIR
else
    INSTALLDIR=$INSTALLDIR/$PREFIXDIR
fi

mkdir -p $INSTALLDIR/bin
cp trayIcon $INSTALLDIR/bin
for i in battery layouts mail weather; do
    cd $i
    ./install.sh $INSTALLDIR $PREFIXDIR 
    cd ..
done
