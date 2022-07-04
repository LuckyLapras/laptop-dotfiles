#!/bin/dash

xidlehook \
  `# Don't lock when there's a fullscreen application` \
  --not-when-fullscreen \
  `# Don't lock when there's audio playing` \
  --not-when-audio \
  `# Dim the screen after 60 seconds, undim if user becomes active` \
  --timer 60 \
    'grep 0 /sys/class/power_supply/ADP0/online > /dev/null && xbacklight -get > /tmp/bness.txt &&  xbacklight =1' \
    'grep 0 /sys/class/power_supply/ADP0/online > /dev/null && xbacklight =$(cat /tmp/bness.txt)' \
    `# Undim & lock after 30 more seconds` \
  --timer 30 \
    'grep 0 /sys/class/power_supply/ADP0/online > /dev/null && i3lock -i /home/lily/Pictures/Wallpapers/yliaed.png && sleep 1&& xbacklight =$(cat /tmp/bness.txt)' \
    '' \
  `# Finally, suspend an hour after it locks` \
  --timer 300 \
    'grep 0 /sys/class/power_supply/ADP0/online > /dev/null && systemctl suspend' \
    ''
