#!/bin/bash

BATC=/sys/class/power_supply/BAT0/capacity
BATS=/sys/class/power_supply/BAT0/status

#test "`cat $BATS`" = "Charging" && echo -n '+' || echo -n '-'

number=$(cat $BATC)

#echo $number

if [[ $(cat $BATC) -le 10 ]];
then
   label=""
elif [[ $(cat $BATC) -le 20 ]]; 
then
	label=""
elif [[ $(cat $BATC) -le 30 ]];
then		
    label=""
elif [[ $(cat $BATC) -le 40 ]];
then		
    label=""
elif [[ $(cat $BATC) -le 50 ]];
then		
    label=""
elif [[ $(cat $BATC) -le 60 ]];
then		
    label=""
elif [[ $(cat $BATC) -le 70 ]];
then		
    label=""
elif [[ $(cat $BATC) -le 80 ]];
then		
    label=""
elif [[ $(cat $BATC) -le 98 ]];
then		
    label=""
else
	label=""
fi

if [ "$(cat $BATS)" == "Charging" ] || [ "$(cat $BATS)" == "Full" ];
then
    label=""
fi


string="$label $number"

echo "$string"
