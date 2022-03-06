#!/bin/bash

export DIR=/home/lily/Pictures/Screenshots/$(date +\%Y-\%m)
export FILENAME=Screenshot-$(date +\%Y\%m\%d-\%H\%M\%S).png
mkdir -p $DIR
export MESSAGE="File saved to $DIR/$FILENAME" 

while getopts ":qaws" option; do
    case $option in
        q) touch $DIR/$FILENAME
           exec escrotum $DIR/$FILENAME
           exit;;
        a) touch $DIR/$FILENAME
           exec escrotum -s $DIR/$FILENAME 
           exit;;
        w) exec escrotum -C
           exit;;
        s) exec escrotum -s -C 
           exit;;
    esac
done
