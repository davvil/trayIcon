#!/bin/bash

DIR=`dirname $0`

while true; do
    acpiOutput=(`acpi`)
    status=${acpiOutput[2]}
    status=${status:0:-1}
    level=${acpiOutput[3]}
    level=${level%\%*}
    timeRemaining=${acpiOutput[4]}
    if [[ $status == Charging || $status == Full || $status == Unknown ]]; then
        icon=$DIR/icons/charge-${level}.png
    else
        icon=$DIR/icons/discharge-${level}.png
    fi
    echo icon $icon
    tooltip="$status, ${level}%"
    if [ "$timeRemaining" != "" ]; then
        tooltip="$tooltip, $timeRemaining"
    fi
    echo tooltip $tooltip
    sleep 10
done | $DIR/../trayIcon
