#!/bin/bash

cpu=$(ps -eo pcpu | awk 'BEGIN {sum=0.0f} {sum+=$1} END {print sum}')

echo -e $cpu'%'
