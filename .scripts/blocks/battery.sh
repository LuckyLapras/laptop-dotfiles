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
        { [ $BATC -gt 59 ] && { [ $BATS = "Charging" ] || [ $BATS = "Unknown" ] || [ $BATS = "Not charging" ]; }; } && dunstify -r $NID 'i care that u transgender' 'u can stop charging yo damn laptop' || dunstify -C $NID
        ;;
    [2-3]?) label=' '
        ;;
    *)      underline=$crit
        label=' '
        case $BATS in
            Discharging) dunstify -u critical -r $NID 'i dont care if u transgender' 'charge yo damn laptop'
        esac
        ;;
    esac

    label="%%{F#ec3257}"$label"%%{F-}"

    case $BATS in
        Charging|Unknown|"Not charging") 
            [ $BATC -ge 20 ] && dunstify -C $NID
            [ $BATC -ge 61 ] && dunstify -r $NID 'how tf'
            underline=$char
            ;;
        Full)             dunstify -r $NID 'how tf'
            underline=$char
            ;;
        *)  { [ $BATS = "Charging" || [ $BATS = "Unknown" ]; } && dunstify -C $NID
            ;;
    esac

    # i want to have space for stalonetray after this block. there\'s probably a more elegant way to do this but for now
    # i\'ll check stalonetray\'s size along with the battery and adjust the right margin accordingly
    # (the backslashes are here bc leaving them out fucks with syntax highlighting)
    space=$(( 5 + $(xprop -name stalonetray -f WM_SIZE_HINTS 32i ' $5\n' WM_NORMAL_HINTS | awk '{print $2}') ))

    string="%%{+$uoline}%%{U$underline}$label$BATC%%%%%%{U-}%%{-$uoline}%%{O$space}\\n"
    printf "$string"
}

trap 'battery' 44

while :;
do
    battery
    sleep 30 &
    wait
done
