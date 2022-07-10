#!/bin/dash

BATC=/sys/class/power_supply/BAT0/capacity
BATS=/sys/class/power_supply/BAT0/status

#need to set an arbitrarily high NID for dunst
#maybe it doesn't need to be arbitrarily high i just thought it'd be safer
NID=420
#(i choose the funny weed number :3)

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
    *)  label=' '
        case $(cat $BATS) in
            Discharging) dunstify -u critical -r $NID 'i dont care if u transgender' 'charge yo damn laptop'
        esac
        ;;
esac

    case $(cat $BATS) in
        Charging|Unknown) [ $(cat $BATC) -le 20 ] && dunstify -C $NID
            label=""
            ;;
        Full)             dunstify -r $NID 'how tf'
            label=""
            ;;
        *)                [ $(cat $BATC) -gt 20 ] && [ $(cat $BATC) -le 58 ] && dunstify -C $NID
            ;;
    esac

string="$label $(cat $BATC)%%\\n"
printf "$string"
