#!/bin/dash

wifi() {
    int="wlp2s0"
    #pacman -S wireless_tools
    SSID=$(iwgetid -r)

    ping -c 1 8.8.8.8 >/dev/null 2>&1 && printf '%%{+u}%%{U#f7a8b8}%%{F#ec3257}直 %%{F-}'$SSID'%%{-u}'\\n || printf '%%{+u}%%{U#cccccc}%%{F#ec3257}睊 Disconnected%%{U-}%%{-u}'\\n
}

trap 'wifi' 42

while :;
do
    wifi
    sleep 60 &
    wait
done
