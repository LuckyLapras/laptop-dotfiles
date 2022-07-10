#!/bin/dash

vol=$(/home/lily/.scripts/blocks/volume-pulse -w "MUTED")

label=''

case $vol in
    100|[6-9]?) sym="墳"
        ;;
    [2-5]?)     sym="奔"
        ;;
    [1-9]|1?)   sym="奄"
        ;;
    *)          sym="ﱝ"
esac

hphone=$(pactl list sinks | grep "Active Port" | awk '{print $3}')
output=$(pactl get-default-sink)

case $hphone in
    analog-output-headphones) sym=""
        ;;
    *) case $output in
        bluez_output*)        sym=""
       esac
esac

printf "$sym $vol%%\\n"
