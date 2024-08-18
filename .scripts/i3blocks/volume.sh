#!/bin/dash

volume() {
vol=$($HOME/.scripts/blocks/volume-pulse -w "")

label=''

case $vol in
    100|[6-9]?) col="#D7F3FE"
                sym="墳"
                vol="$vol%%"
        ;;
    [2-5]?)     col="#D7F3FE"
                sym="奔"
                vol="$vol%%"
        ;;
    [1-9]|1?)   col="#D7F3FE"
                sym="奄"
                vol="$vol%%"
        ;;
    *)          col="#696969"
                sym="ﱝ"
esac

hphone=$(pactl list sinks | grep "Active Port" | awk '{print $3}')
output=$(pactl get-default-sink)

case $hphone in
    analog-output-headphones) sym=""
        ;;
    *) case $output in
        bluez_output*)        sym=""
       esac
esac

label="%%{F$col}%%{F-}%%{B$col}$sym"
printf "$label $vol %%{B$col}%%{F#C3EDFE}%%{B-}%%{F-}"
}

trap 'volume' 41

volume

while :;
do
    sleep infinity &
    wait
done
