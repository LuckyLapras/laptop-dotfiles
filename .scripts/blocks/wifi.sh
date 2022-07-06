#!/bin/dash

wifi() {
    int="wlp2s0"
    SSID=$(iw "$int" info | awk '/ssid/ {$1=""; print $0}' | sed 's/^.//')

    ping -c 1 8.8.8.8 >/dev/null 2>&1 
    #&& printf '%%{+u}%%{U#f7a8b8}%%{F#ec3257}直 %%{F-}'$SSID'%%{-u}'\\n || printf '%%{+u}%%{U#cccccc}%%{F#ec3257}睊 Disconnected%%{U-}%%{-u}'\\n

    case $? in
        0) printf '%%{+u}%%{U#f7a8b8}%%{F#ec3257}直 %%{F-}'$SSID'%%{-u}'\\n 
            ;;
        1) ping -c 1 google.com >/dev/null 2>&1
            case $? in
                0) printf '%%{+u}%%{U#86dcfc}%%{F#ec3257}睊 DNS Issue%%{U-}%%{-u}'\\n
                    ;;
                1) printf '%%{+u}%%{U#cccccc}%%{F#ec3257}睊 Disconnected%%{U-}%%{-u}'\\n
            esac
    esac
}

trap 'wifi' 42

while :;
do
    wifi
    sleep 60 &
    wait
done
