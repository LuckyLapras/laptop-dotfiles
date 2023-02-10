#!/bin/sh

#call this script in a systemd service which is called in a udev rule

pkill -RTMIN+10 battery.sh

BATS=/sys/class/power_supply/BAT0/status

case $(cat $BATS) in
    Charging|Unknown|Full|"Not charging") brightnessctl -s && brightnessctl s $(brightnessctl max)
        ;;
    *) brightnessctl -r
esac
