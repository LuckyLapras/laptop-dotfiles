#!/bin/dash

brightness() {
    brightn=$(xbacklight -get)
    bness=${brightn%.*}

    printf "%%{B#C3EDFE} $bness%%{O5}%%{F#AFE7FE}%%{F-}%%{B-}"
}

trap 'brightness' 40

brightness

while :;
do
    sleep infinity &
    wait
done
