#!/bin/dash

brightness() {
bness=''
#label="%%{F#ec3257} %%{F-}"

brightn=$(xbacklight -get)
bness=${brightn%.*}


printf '%%{+u}%%{U#f7a8b8}%%{T2}%%{F#ec3257} %%{F-}%%{T-}'$bness'%%{-u}'\\n
}

trap 'brightness' 40

brightness

while :;
do
	sleep infinity &
	wait
done
