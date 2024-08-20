#!/bin/dash

volume() {
vol=$(/home/lily/.scripts/blocks/volume-pulse -w "MUTED")

label=''

case $vol in
    100|[6-9]?) uline="%%{U#ec3257}"
                sym="墳"
                vol=$vol%%%
        ;;
    [2-5]?)     uline="%%{U#f7a8b8}"
                sym="奔"
                vol=$vol%%%
        ;;
    [1-9]|1?)   uline="%%{U#f7a8b8}"
                sym="奄"
                vol=$vol%%%
        ;;
    *)          uline="%%{U#696969}"
                sym="ﱝ"
esac

hphone=$(pactl list sinks | grep "Active Port" | awk '{print $3}')
output=$(pactl get-default-sink)

case $hphone in
    analog-output-headphones) sym=""
        ;;
    *) case $output in
        bluez_output*)        sym=""
            uline="%%{U#86dcfc}"
       esac
esac

label='%%{+u}'$uline'%%{F#ec3257}'$sym'%%{F-}'
printf $label' '$vol'%%{-u}'\\n
}

trap 'volume' 41

volume

while :;
do
    sleep infinity &
    wait
done
