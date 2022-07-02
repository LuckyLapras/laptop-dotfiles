#!/bin/bash

volume() {
vol=$(/home/lily/.scripts/blocks/volume-pulse -w "MUTED")

label=''

if [[ $vol -le 20 ]]
then
	uline="%%{U#f7a8b8}"
	sym="奄"
elif [[ $vol -le 60 ]]
then
	uline="%%{U#f7a8b8}"
	sym="奔"
else
	uline="%%{U#ec3257}"
	sym="墳"
fi

if [ "$vol" = "MUTED" ]
then
	uline="%%{U#cccccc}"
	sym="ﱝ"
fi

hphone=$(pactl list sinks | grep "Active Port" | awk '{print $3}')
output=$(pactl get-default-sink)

if [ "$hphone" = "analog-output-headphones" ]
then
	sym=""
elif [[ "$output" = "bluez_output"* ]]
then
	sym=""
fi

label='%%{+u}'$uline'%%{F#ec3257}'$sym'%%{F-}'
printf $label' '$vol'%%%%''%%{U-}%%{-u}'\\n
}

trap 'volume' 41

volume

#python -c 'while 1: import ctypes; ctypes.CDLL(None).pause()'
while :;
do
	sleep infinity &
	wait
done
