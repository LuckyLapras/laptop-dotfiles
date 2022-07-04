#!/bin/dash

label() {
    label="%%{F#ec3257}"$1"%%{F-}"
}

battery() {
    BATC=/sys/class/power_supply/BAT0/capacity
    BATS=/sys/class/power_supply/BAT0/status

    #need to set an arbitrarily high NID for dunst
    #maybe it doesn't need to be arbitrarily high i just thought it'd be safer
    NID=420
    #(i choose the funny weed number :3)

    #define some colours
    norm="#ec3257"
    crit="#cd1338"
    char="#86dcfd"

    uoline=u

    string=""
    string="$string%%{+$uoline}"

    underline=$norm

    case $(cat $BATC) in
        [0-9]|1[0-9])  underline=$crit
            label=$(label ' ')
            case $(cat $BATS) in
                Discharging) dunstify -u critical -r $NID 'i dont care if u transgender' 'charge yo damn laptop'
            esac
            ;;
        2[0-9]|3[0-9]) label=$(label ' ')
            ;;
        4[0-9]|5[0-9]) label=$(label ' ')
            ;;
        6[0-9]|7[0-9]) label=$(label ' ')
            ;;
        8[0-9]|9[0-9]) label=$(label ' ')
            ;;
        *)             label=$(label ' ')
            ;;
    esac

    case $(cat $BATS) in
        Charging|Unknown) dunstify -C $NID
            underline=$char
            ;;
        Full)             dunstify -r $NID 'i care that u transgender' 'u can stop charging yo damn laptop'
            underline=$char
            ;;
        *)                dunstify -C $NID
            ;;
    esac

    string="$string%%{U$underline}$label"

    string="$string$(cat $BATC)"

    string="$string%%%%"

    string="$string%%{U-}"

    string="$string%%{-$uoline}%%{O8}"

    printf "$string"\\n
}

trap 'battery' 44

while :;
do
    battery
    sleep 30 &
    wait
done
