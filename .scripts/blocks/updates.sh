#!/bin/dash

updates() {
	upd=$(echo $(/home/lily/.scripts/blocks/checkupdates 2>/dev/null | wc -l))
    printf $upd
}

trap 'updates' 38

updates

while :;
do
	sleep 3000 &
	wait
done
