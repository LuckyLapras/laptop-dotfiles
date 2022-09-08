#!/bin/dash

if ls /tmp/bness.txt.*; then
    export bness_file=$(ls /tmp/bness.txt.*)
else
    export bness_file=$(mktemp /tmp/bness.txt.XXX)
fi

num=69
cmd1='echo $num'
xidlehook \
  `# Don't lock when there's a fullscreen application` \
  --not-when-fullscreen \
  `# Don't lock when there's audio playing` \
  --not-when-audio \
  `# Dim the screen after 60 seconds, undim if user becomes active` \
  --timer 60 \
    'grep 0 /sys/class/power_supply/ADP0/online > /dev/null && xbacklight -get > "$bness_file" && xbacklight -fps 30 -set 1' \
    'grep 0 /sys/class/power_supply/ADP0/online > /dev/null && xbacklight -fps 30 -set $(cat "$bness_file")' \
    `# Undim & lock after 30 more seconds` \
  --timer 30 \
    'grep 0 /sys/class/power_supply/ADP0/online > /dev/null && i3lock -i /home/lily/Pictures/Wallpapers/yliaed.png && sleep 1 && xbacklight -fps 30 -set $(cat "$bness_file")' \
    '' \
  `# Finally, suspend five minutes after it locks` \
  --timer 300 \
    'grep 0 /sys/class/power_supply/ADP0/online > /dev/null && systemctl suspend' \
    ''
