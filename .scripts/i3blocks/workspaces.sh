#!/bin/bash

# Variable Declarations
col_focused="#55CDFC"
col_inactive="#AFE7FE"
col_urgent="#0EB8FB"

# Get Workspace Information
all=$(wmctrl -d)

str=""

while read line
do
    num=${line:0:1}
    name=${line: -1}
    cur=${line:3:1}

    case $cur in
        '*') col=$col_focused
            ;;
        *)   col=$col_inactive
    esac

    if [ $num -eq 0 ]; then
        str="$str%%{B$col}%%{O5}"
    else
        str="$str%%{F$col_prev}%%{B$col}%%{F-}"
    fi

    str="$str$name%%{B-}"
    col_prev=$col
done <<< $all

str="$str%%{F$col_prev}%%{F-}"
printf "$str"
