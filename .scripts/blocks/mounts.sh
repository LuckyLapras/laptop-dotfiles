#!/bin/dash

mounts() {
    devs=`ls -al /dev/disk/by-label 2>/dev/null | awk 'NR > 3 {print $11}'`
    num=`echo "$devs" | wc -l`

    if [ "$devs" = "" ]; then
        uline="#696969"
        num=0
    else
        uline="#f7a8b8"
        for dev in $devs
        do
            dev=${dev##*\/}
            if grep -q $dev /etc/mtab; then
                uline="#86dcfd"
                break
            fi
        done
    fi

    printf "%%{+u}%%{U$uline}%%{F#ec3257}%%{F-} $num%%{U-}%%{-u}\\n"
}

trap 'mounts' 45

mounts

while :;
do
    sleep infinity &
    wait
done
