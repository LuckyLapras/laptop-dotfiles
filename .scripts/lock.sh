#!/bin/dash

xidlehook \
  `# initialise socket?` \
  --socket /tmp/xidlehook.sock \
  `# Don't lock when there's a fullscreen application` \
  --not-when-fullscreen \
  `# Don't lock when there's audio playing` \
  --not-when-audio \
  `# Dim the screen after 60 seconds, undim if user becomes active` \
  --timer 60 \
    'grep 0 /sys/class/power_supply/ADP0/online > /dev/null && brightnessctl -s && xbacklight -fps 30 -set 1' \
    'grep 0 /sys/class/power_supply/ADP0/online > /dev/null && brightnessctl -r' \
    `# Undim & lock after two more minutes` \
  --timer 120 \
    'i3lock -i $HOME/Pictures/Wallpapers/yliaed.png && brightnessctl -r' \
    '' \
  `# Finally, suspend five minutes after it locks if on power` \
  --timer 300 \
    'grep 0 /sys/class/power_supply/ADP0/online > /dev/null && systemctl suspend' \
    ''
