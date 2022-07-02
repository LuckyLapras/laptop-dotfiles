#!/bin/bash

# store the total and free memory in two variables
free=$(cat /proc/meminfo | grep MemFree | awk '{print $2}')
t=$(cat /proc/meminfo | grep MemTotal | awk '{print $2}')

# then, calcultate the percentage of memory used
f=$(expr -1 \* $free)

u=$(expr $t - $free)
ratio=$(expr $u / $t)

ram=$(expr 100 \* $ratio)

echo -e $ratio'%'
