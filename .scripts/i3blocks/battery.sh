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
        { [ $BATC -gt 59 ] && { [ $BATS = "Charging" ] || [ $BATS = "Unknown" ] || [ $BATS = "Not charging" ]; }; } && dunstify -r $NID 'i care that u transgender' 'u can stop charging yo damn laptop' || dunstify -C $NID
        ;;
    [2-3]?) label=' '
        ;;
    *)      label=' '
        case $BATS in
            Discharging) dunstify -u critical -r $NID 'i dont care if u transgender' 'charge yo damn laptop'
        esac
        ;;
    esac

    case $BATS in
        Charging|Unknown|"Not charging")
            [ $BATC -ge 20 ] && dunstify -C $NID
            [ $BATC -ge 61 ] && dunstify -r $NID 'how tf'
            ;;
        Full)             dunstify -r $NID 'how tf'
            ;;
        *)  { [ $BATS = "Charging" || [ $BATS = "Unknown" ]; } && dunstify -C $NID
            ;;
    esac

    printf "%%{B#72D6FD}%%{O5}%%{F#5ED0FD}%%{B-}%%{F-}%%{B#5ED0FD}$label$BATC%%\\n"
}

trap 'battery' 44

while :;
do
    battery
    sleep 30 &
    wait
done
