#!/bin/bash

d=$(date +'%Y-%m-%d')
t=$(date +'%H:%M')

printf '%%{+u}%%{U#f7a8b8}'$d' '$t'%%{U-}%%{-u}'
