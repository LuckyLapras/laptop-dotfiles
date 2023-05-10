#!/bin/sh

#call this script in a systemd service which is called in a udev rule

pkill -RTMIN+10 battery.sh

BATS=/sys/class/power_supply/BAT0/status

# we sleep here bc my charger sucks and gets knocked out very easily which fucks up the saving process
# (i'm sick of my brightness getting set to 100 randomly without me realising)

case $(cat $BATS) in
    Charging|Unknown|Full|"Not charging") sleep 5 && $HOME/.local/bin/save_backlight.sh save && $HOME/.local/bin/save_backlight.sh load
        ;;
    *) sleep 5 && $HOME/.local/bin/save_backlight.sh load && $HOME/.local/bin/save_backlight.sh save
esac
