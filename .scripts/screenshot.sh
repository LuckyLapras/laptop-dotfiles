#!/bin/bash

export DIR=$HOME/Pictures/Screenshots/$(date +\%Y-\%m)
export FILENAME=Screenshot-$(date +\%Y\%m\%d-\%H\%M\%S).png
mkdir -p $DIR
export MESSAGE="File saved to $DIR/$FILENAME"

notify() {
    notify-send -i $DIR/$FILENAME "Screenshot taken!" "$MESSAGE" -a 'screenshot.sh'
}

selection() (
    # take screenshot without cursor and pipe to feh, get its pid
    maim -u | feh - &
    feh_pid=$!

    # wait for feh to start
    while [ -z "$(xdotool search --pid "$feh_pid")" ]; do
        sleep 0.1
    done

    # get window ID of feh
    wid="$(xdotool search --pid "$feh_pid")"

    # fullscreen feh and move top-left (works with multi-monitor)
    xdotool windowsize "$wid" 100% 100%
    xdotool windowmove "$wid" 0 0

    # take the new screenshot by selection, pipe to clipboard
    maim -s -r boxzoom -u "$DIR/$FILENAME"

    # kill feh
    kill "$feh_pid"
)

case $1 in
    sel) #maim -s -r boxzoom -u $DIR/$FILENAME
       selection
       if [ -f $DIR/$FILENAME ]; then
           xclip -sel clip < /dev/null
           xclip -selection clip -t image/png $DIR/$FILENAME
           notify
       fi
       exit;;
    win) maim -u -i $(xdotool getactivewindow) $DIR/$FILENAME
       xclip -sel clip < /dev/null
       xclip -selection clip -t image/png $DIR/$FILENAME
       notify
       exit;;
    *) maim -u $DIR/$FILENAME
       xclip -sel clip < /dev/null
       xclip -selection clip -t image/png $DIR/$FILENAME
       notify
       exit;;
esac
