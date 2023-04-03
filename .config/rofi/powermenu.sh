#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

dir="$HOME/.config/rofi"
rofi_command="rofi -theme $dir/powermenu.rasi"

uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""

askpass_cmd() {
    SUDO_ASKPASS=~/.local/bin/rofi_askpass sudo -A $@
}

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
			askpass_cmd systemctl poweroff
            ;;
    $reboot)
			askpass_cmd systemctl reboot
            ;;
    $lock)
			askpass_cmd i3lock
            ;;
    $suspend)
			askpass_cmd mpc -q pause && systemctl suspend
            ;;
    $logout)
		    askpass_cmd bspc quit
            ;;
esac
