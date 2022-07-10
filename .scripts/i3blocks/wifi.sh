#!/bin/dash

int="wlp2s0"
SSID=$(iw "$int" info | awk '/ssid/ {$1=""; print $0}' | sed 's/^.//')

ping -c 1 8.8.8.8 >/dev/null 2>&1 && printf "直 $SSID\\n" || printf "睊 Disconnected\\n"

