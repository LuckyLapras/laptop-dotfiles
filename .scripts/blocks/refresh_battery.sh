#!/bin/sh

#call this script in a systemd service which is called in a udev rule

pkill -RTMIN+10 battery.sh

BATS=/sys/class/power_supply/BAT0/status

if ls /tmp/bness.txt.*; then
    file=$(ls /tmp/bness.*)
else
    file=$(mktemp /tmp/bness.txt.XXX)
fi

chmod 666 "$file"

if [[ $(cat "$file") = "" ]]; then
    echo 39 > "$file"
fi

case $(cat $BATS) in
    Charging|Unknown|Full) xbacklight -get > "$file" && xbacklight -fps 30 -set 100
        ;;
    *) xbacklight -fps 30 -set $(cat "$file")
esac

pkill -RTMIN+6 brightness.sh
