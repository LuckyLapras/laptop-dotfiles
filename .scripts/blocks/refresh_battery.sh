#!/bin/bash

#call this scripts in a udev rule

pkill -RTMIN+10 battery.sh

BATS=/sys/class/power_supply/BAT0/status

case $(cat $BATS) in
    Charging|Unknown|Full) xbacklight -get > /tmp/bness.txt && xbacklight =100
        ;;
    *) xbacklight =$(cat /tmp/bness.txt)
esac

