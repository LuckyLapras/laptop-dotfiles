#!/bin/dash

battery() {
    BATC=$(cat /sys/class/power_supply/BAT0/capacity)
    BATS=$(cat /sys/class/power_supply/BAT0/status)

    # need to set an arbitrarily high NID for dunst
    # maybe it doesn't need to be arbitrarily high i just thought it'd be safer
    NID=420
    # (i choose the funny weed number :3)

    # define some colours
    norm="#f7a8b8"
    crit="#cd1338"
    char="#86dcfd"

    uoline=u
    underline=$norm

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
    *)      underline=$crit
        label=' '
        case $BATS in
            Charging|Unknown|"Not Charging") dunstify -C $NID
                ;;
        esac
        ;;
    esac

    label="%%{F#ec3257}"$label"%%{F-}"

    case $BATS in
        Charging|Unknown|"Not charging"|Full)
            [ $BATC -eq 80 ] && notify-send -r $NID 'i care that u transgender' 'u can stop charging yo damn laptop' -a 'battery.sh'
            underline=$char
            ;;
        Discharging)
            [ $BATC -ge 21 ] && dunstify -C $NID
            underline=$norm
            ;;
    esac

    string="%%{+$uoline}%%{U$underline}$label$BATC%%%%%%{U-}%%{-$uoline}\\n"
    printf "$string"
}

trap 'battery' 44

while :;
do
    battery
    sleep 30 &
    wait
done
