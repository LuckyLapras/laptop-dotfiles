#!/bin/dash

battery() {
    BATC=$(cat /sys/class/power_supply/BAT0/capacity)
    BATS=$(cat /sys/class/power_supply/BAT0/status)

    # need to set an arbitrarily high NID for dunst
    # maybe it doesn't need to be arbitrarily high i just thought it'd be safer
    NID=420
    # (i choose the funny weed number :3)

    case $BATC in
    100)    label=' '
        ;;
    [8-9]?) label=' '
        ;;
    [6-7]?) label=' '
        ;;
    [4-5]?) label=' '
        ;;
    [2-3]?) label=' '
        ;;
    *)      label=' '
        case $BATS in
            Chargin|Unknown|"Not Charging") dunstify -C $NID
        esac
        ;;
    esac

    case $BATS in
        Charging|Unknown|"Not charging"|Full)
            [ $BATC -eq 80 ] && notify-send -r $NID 'i care that u transgender' 'u can stop charging yo damn laptop' -a 'battery.sh'
            ;;
        *)  [ $BATC -ge 21 ] && dunstify -C $NID || notify-send -r $NID "i don't care if u transgender" 'charge yo damn laptop' -a 'battery.sh'
            ;;
    esac

    printf "%%{B#72D6FD}%%{O5}%%{F#5ED0FD}%%{B-}%%{F-}%%{B#5ED0FD}$label$BATC%% %%{F#4ACAFC}%%{B-}%%{F-}\\n"
}

trap 'battery' 44

while :;
do
    battery
    sleep 30 &
    wait
done
