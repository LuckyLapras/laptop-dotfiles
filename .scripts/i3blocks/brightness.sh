#!/bin/bash

brightness() {
bness=''
#label="%%{F#ec3257} %%{F-}"

brightness=$(xbacklight -get)
bness=${brightness%.*}

printf '%%{+u}%%{U#f7a8b8}%%{T2}%%{F#ec3257} %%{F-}%%{T-}'$bness'%%{-u}'
}

trap 'brightness' 40

while :;
do
#	sleep 1
	wait
done
