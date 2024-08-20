#!/bin/dash

mounts() {
    devs=`ls -al /dev/disk/by-label 2>/dev/null | awk 'NR > 3 {print $11}'`
    num=`echo "$devs" | wc -l`

    if [ "$devs" = "" ]; then
        num=0
    else
        for dev in $devs
        do
            dev=${dev##*\/}
            if grep -q $dev /etc/mtab; then
                break
            fi
        done
    fi

    printf "%%{F#86DCFD}%%{B#9BE1FD}%%{O5}%%{B-}%%{F-}%%{B#86DCFD} $num%%{B-}\\n"
}

trap 'mounts' 45

mounts

while :;
do
    sleep infinity &
    wait
done
