#!/bin/bash

#width=$(xprop -name stalonetray -f WM_SIZE_HINTS 32i ' $5\n' -spy WM_NORMAL_HINTS | cut -c 32-)
width=72
result="%%{O$width}"

printf $result 
