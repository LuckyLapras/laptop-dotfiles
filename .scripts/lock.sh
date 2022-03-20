#!/usr/bin/env bash

#old script
#i3lock -i /home/lily/Pictures/Wallpapers/yliaed.png
#systemctl suspend

#new script
# Only exported variables can be used within the timer's command.
export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"

# Run xidlehook
xidlehook \
  `# Don't lock when there's a fullscreen application` \
  --not-when-fullscreen \
  `# Don't lock when there's audio playing` \
  --not-when-audio \
  `# Dim the screen after 60 seconds, undim if user becomes active` \
  --timer 60 \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness .1' \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness 1' \
  `# Undim & lock after 10 more seconds` \
  --timer 10 \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness 1; i3lock -i /home/lily/Pictures/Wallpapers/yliaed.png' \
    '' \
  `# Finally, suspend an hour after it locks` \
  --timer 300 \
    'systemctl suspend' \
    ''
#e
