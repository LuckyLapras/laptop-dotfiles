#!/bin/dash

wifi() {
    int="wlp2s0"
    #pacman -S wireless_tools
    SSID=$(iwgetid -r)

    ping -c 1 8.8.8.8 >/dev/null 2>&1 && printf "%%{B#86DCFD}%%{O5}%%{F#72D6FD}%%{F-}%%{B#72D6FD}直 $SSID%%{B-}\\n" || printf "%%{B#86DCFD}%%{O5}%%{F#72D6FD}%%{F-}%%{B#72D6FD}睊 Disconnected%%{B-}\\n"
}

trap 'wifi' 42

while :;
do
    wifi
    sleep 60 &
    wait
done
