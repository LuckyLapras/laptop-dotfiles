#!/bin/sh

#call this script in a udev rule

pkill -RTMIN+10 battery.sh

ADPS=/sys/class/power_supply/ADP0/online

case $(cat $ADPS) in
    '1') sleep 1 && \
        brightnessctl -s && xbacklight -fps 30 -set 100 && pkill -RTMIN+6 brightness.sh && \
        echo 'max_performance' >/sys/class/scsi_host/host0/link_power_management/policy && \
        echo 'max_performance' >/sys/class/scsi_host/host1/link_power_management/policy
        ;;
    '0') sleep 1 && \
        brightnessctl -r && pkill -RTMIN+6 brightness.sh && \
        echo 'med_power_with_dipm' >/sys/class/scsi_host/host0/link_power_management/policy && \
        echo 'med_power_with_dipm' >/sys/class/scsi_host/host1/link_power_management/policy
        ;;
esac
