#!/bin/dash

#old script
#i3lock -i /home/lily/Pictures/Wallpapers/yliaed.png
#systemctl suspend

#new script

lock() {
    # Only exported variables can be used within the timer's command.
    export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"

    # Run xidlehook only when discharging
    BATS=/sys/class/power_supply/BAT0/status
    status=$(cat $BATS)
    if [ "$status" == "Discharging" ]
    then
        xidlehook \
          `# Don't lock when there's a fullscreen application` \
          --not-when-fullscreen \
          `# Don't lock when there's audio playing` \
          --not-when-audio \
          `# Dim the screen after 60 seconds, undim if user becomes active` \
          --timer 60 \
            'xbacklight -50' \
            'xbacklight +50' \
          `# Undim & lock after 10 more seconds` \
          --timer 10 \
            'i3lock -i /home/lily/Pictures/Wallpapers/yliaed.png; sleep 1; xbacklight +50' \
            '' \
          `# Finally, suspend an hour after it locks` \
          --timer 300 \
            'systemctl suspend' \
            ''
    fi
}

trap 'lock' 45

lock

while :;
do
    sleep infinity &
    wait
done
