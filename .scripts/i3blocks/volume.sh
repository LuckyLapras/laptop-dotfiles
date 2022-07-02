#!/bin/bash

volume() {
vol=$(/home/lily/.scripts/blocks/volume-pulse -w "MUTED")

label=''


if [[ $vol -le 20 ]]
then
	sym="奄"
elif [[ $vol -le 60 ]]
then
	sym="奔"
else
	sym="墳"
fi

if [ "$vol" = "MUTED" ]
then
	sym="ﱝ"
fi

printf $sym' '$vol'%%%%'
}

volume
