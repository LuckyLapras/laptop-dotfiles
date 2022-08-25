#!/bin/dash

updates() {
    upd=$(echo $(/home/lily/.scripts/blocks/checkupdates 2>/dev/null | wc -l))

    case $upd in
        0) uline="#696969"
            ;;
        [1-9]|[1-4]?) uline="#f7a8b8"
            ;;
        *) uline="#ec3257"
            ;;
    esac

    printf "%%{u+}%%{U$uline}%%{F#ec3257}%%{F-} $upd%%{U-}%%{-u}\\n"
}

trap 'updates' 38

updates

while :;
do
    sleep 3000 &
    wait
done
