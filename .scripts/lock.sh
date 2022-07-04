#!/bin/dash

xidlehook \
  `# Don't lock when there's a fullscreen application` \
  --not-when-fullscreen \
  `# Don't lock when there's audio playing` \
  --not-when-audio \
  `# Dim the screen after 60 seconds, undim if user becomes active` \
  --timer 60 \
    'grep 0 /sys/class/power_supply/ADP0/online > /dev/null && xbacklight -35' \
    'grep 0 /sys/class/power_supply/ADP0/online > /dev/null && xbacklight +35' \
    `# Undim & lock after 10 more seconds (i would like to be able to have a brightness variable here and return the screen to the brightness it was at before instead of forcing a 35% change (i doubt i'll have my screen any lower than that) but setting a variable inside the time doesn't seem to work. i could set it outside the xidlehook command but then it would be set at the start of the session` \
  --timer 10 \
    'grep 0 /sys/class/power_supply/ADP0/online > /dev/null && i3lock -i /home/lily/Pictures/Wallpapers/yliaed.png && sleep 1&& xbacklight +35' \
    '' \
  `# Finally, suspend an hour after it locks` \
  --timer 300 \
    'grep 0 /sys/class/power_supply/ADP0/online > /dev/null && systemctl suspend' \
    ''
