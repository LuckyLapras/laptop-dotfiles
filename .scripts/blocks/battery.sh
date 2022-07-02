#!/bin/dash


battery() {
    BATC=/sys/class/power_supply/BAT0/capacity
    BATS=/sys/class/power_supply/BAT0/status

#test "`cat $BATS`" = "Charging" && echo -n '+' || echo -n '-'

    number=$(cat $BATC)

#echo $number

    uoline=u

    string=""
    string="$string%%{+$uoline}"

    underline=""

    if [ $(cat $BATC) -le 10 ];
    then
        underline="#cd1338"
        label="%%{F#ec3257} %%{F-}"
    elif [ $(cat $BATC) -le 20 ];
    then
        underline="#cd1338"
        label="%%{F#ec3257} %%{F-}"
        if [ "$(cat $BATS)" == "Discharging" ];
        then
            NID=$(dunstify -u critical -p 'i dont care if u transgender' 'charge yo damn laptop')
        fi
    elif [ $(cat $BATC) -le 30 ];
    then
        label="%%{F#ec3257} %%{F-}"
    elif [ $(cat $BATC) -le 40 ];
    then
        label="%%{F#ec3257} %%{F-}"
    elif [ $(cat $BATC) -le 50 ];
    then
        label="%%{F#ec3257} %%{F-}"
    elif [ $(cat $BATC) -le 60 ];
    then
        label="%%{F#ec3257} %%{F-}"
    elif [ $(cat $BATC) -le 70 ];
    then
        label="%%{F#ec3257} %%{F-}"
    elif [ $(cat $BATC) -le 80 ];
    then
        label="%%{F#ec3257} %%{F-}"
    elif [ $(cat $BATC) -le 98 ];
    then
        label="%%{F#ec3257} %%{F-}"
    else
        label="%%{F#ec3257} %%{F-}"
    fi

    if [ "$(cat $BATS)" = "Charging" ] || [ "$(cat $BATS)" = "Unknown" ];
    then
        dunstify -C $NID
        underline="#86dcfd"
    elif [ "$(cat $BATS)" = "Full" ];
    then
        dunstify -r $NID 'i care that u transgender' 'u can stop charging yo damn laptop'
        underline="#86dcfd"
    else
        dunstify -C $NID
    fi


    string="$string%%{U$underline}$label"

    string="$string$number"

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
