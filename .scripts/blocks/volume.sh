#!/bin/dash

volume() {
vol=$(/home/lily/.scripts/blocks/volume-pulse -w "MUTED")

label=''

#if [ $vol -le 20 ]
#then
#	uline="%%{U#f7a8b8}"
#	sym="奄"
#elif [ $vol -le 60 ]
#then
#	uline="%%{U#f7a8b8}"
#	sym="奔"
#else
#	uline="%%{U#ec3257}"
#	sym="墳"
#fi
#
#if [ "$vol" = "MUTED" ]
#then
#	uline="%%{U#cccccc}"
#	sym="ﱝ"
#fi

case $vol in
    100|[6-9]?) uline="%%{U#ec3257}"
                sym="墳"
        ;;
    [2-5]?)     uline="%%{U#f7a8b8}"
                sym="奔"
        ;;
    [1-9]|1?)   uline="%%{U#f7a8b8}"
                sym="奄"
        ;;
    *)          uline="%%{U#cccccc}"
                sym="ﱝ"
esac

hphone=$(pactl list sinks | grep "Active Port" | awk '{print $3}')
output=$(pactl get-default-sink)

#if [ "$hphone" = "analog-output-headphones" ]
#then
#	sym=""
#elif [ "$output" = "bluez_output"* ]
#then
#	sym=""
#fi

case $hphone in
    analog-output-headphones) sym=""
        ;;
    *) case $output in
        bluez_output*)        sym=""
            uline="%%{U#86dcfc}"
       esac
esac

label='%%{+u}'$uline'%%{F#ec3257}'$sym'%%{F-}'
printf $label' '$vol'%%%%''%%{U-}%%{-u}'\\n
}

trap 'volume' 41

volume

while :;
do
    sleep infinity &
    wait
done
