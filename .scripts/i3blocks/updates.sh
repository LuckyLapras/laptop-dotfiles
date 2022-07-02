#!/bin/bash

upd=$(echo $(/home/lily/.scripts/blocks/checkupdates 2>/dev/null | wc -l))
label="%%{T2}%%{F#ec3257}%%{T-}%%{F-}"

#printf '%%{+u}%%{U#f7a8b8}'$label' '$upd'%%{-u}'
printf $upd
