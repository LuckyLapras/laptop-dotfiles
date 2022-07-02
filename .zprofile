#
# ~/.bash_profile
#

[[ -f ~/.zshrc ]] && . ~/.zshrc
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx ~/.xinitrc bspwm
fi