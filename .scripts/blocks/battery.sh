#!/bin/dash

battery() {
    BATC=/sys/class/power_supply/BAT0/capacity
    BATS=/sys/class/power_supply/BAT0/status

    #need to set an arbitrarily high NID for dunst
    #maybe it doesn't need to be arbitrarily high i just thought it'd be safer
    NID=420
    #(i choose the funny weed number :3)

    #define some colours
    norm="#f7a8b8"
    crit="#cd1338"
    char="#86dcfd"

    uoline=u
    underline=$norm

    case $(cat $BATC) in
    100)    label=' '
        ;;
    [8-9]?) label=' '
        ;;
    [6-7]?) label=' '
        ;;
    [4-5]?) label=' '
        case $(cat $BATC) in
            59) case $(cat $BATS) in
                Charging|Unknown) dunstify -r $NID 'i care that u transgender' 'u can stop charging yo damn laptop'
                ;;
                *)    dunstify -C $NID
            esac
        esac
        ;;
    [2-3]?) label=' '
        ;;
    *)      underline=$crit
        label=' '
        case $(cat $BATS) in
            Discharging) dunstify -u critical -r $NID 'i dont care if u transgender' 'charge yo damn laptop'
        esac
        ;;
    esac

    label="%%{F#ec3257}"$label"%%{F-}"

    case $(cat $BATS) in
        Charging|Unknown) [ $(cat $BATC) -le 20 ] && dunstify -C $NID
            underline=$char
            ;;
        Full)             dunstify -r $NID 'how tf'
            underline=$char
            ;;
        *)                [ $(cat $BATC) -gt 20 ] && [ $(cat $BATC) -le 58 ] && dunstify -C $NID
            ;;
    esac

    string="%%{+$uoline}%%{U$underline}$label$(cat $BATC)%%%%%%{U-}%%{-$uoline}%%{08}\\n"
    printf "$string"
}

trap 'battery' 44

while :;
do
    battery
    sleep 30 &
    wait
done
