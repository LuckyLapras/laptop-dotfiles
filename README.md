# lily's laptop dotfiles

i should note before saying anything else that these files probably suck please do not hesitate to grill me in the issues (i hope people can actually open issues idk if i've used git correctly)

this repo houses two different rices. i dual-boot arch and ubuntu (studio) on this laptop bc ~~im an idiot~~ doing regular tasks is painfully slow without threading and mixxx demands i don't use threading. these rices will be referred to as "regular" and "kinnie" respectively.

## regular rice

![screenshot](/Pictures/Screenshots/2022-07/Screenshot-20220708-172153.png)

- distro: [arch](https://archlinux.org)
- wm: [bspwm](https://github.com/baskerville/bspwm)
- compositor: [picom](https://github.com/yshui/picom)
- terminal: [luke smith's build of st](https://github.com/LukeSmithxyz/st) (i would try patching and building it myself but it never works out for me)
  - colour scheme: a slightly modified version of [Base2Tone-iterm2-SuburbDark](https://github.com/atelierbram/Base2Tone-iterm2)
- shell: [zsh](https://www.zsh.org)
  - zsh plugins: [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) and [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
  - prompt: [powerlevel10k](https://github.com/romkatv/powerlevel10k)
- bar: [succade](https://github.com/domsson/succade) (i really should learn how to use regular lemonbar at some point)
  - bar uses scripts from .scripts/blocks directory. i believe said scripts should be using dash instead of zsh. (with the exception of the workspaces script, which seems to break under dash)
- notifs: [dunst](https://github.com/dunst-project/dunst)
- editor: [vim](https://www.vim.org/)
  - vim plugins: [vim-airline](https://github.com/vim-airline/vim-airline)
    - airline theme: a small modification of [base16\_vim](https://github.com/vim-airline/vim-airline/blob/master/autoload/airline/themes/dark.vim), edited such that replace mode doesn't suck
- wallpaper: made by my good friend [emile toaster\_chan\_](https://twitter.com/toaster_chan_) (commission emile)
- rofi themes: text launcher and android powermenu adapted from [adi1090x](https://github.com/adi1090x/rofi)
- font: [cozette](https://github.com/slavfox/Cozette)

this is the distro i spend most of my time on my laptop in. it's a rather bad laptop so i've made it as minimal as i possibly can with my current knowledge. please feel free to ask me about whatever's going on in here and also suggest ways in which i can do better.

### known issues

- ~~the rofi dmenu has rounded corners on all sides, which looks a lil bad. im considering switching to pure dmenu or just simply not using the themes but im not sure if that'll be worth it.~~ this has been fixed by simply introducing an x-offset to the rofi theme file. afaik that's the only way to do this rn but i'll leave this here so i remember to come back to it in case it does become and option in the future.
- the battery script causes a huge cpu spike when (dis)connecting the charger ~~(although that might just be bc my cpu's bad). im looking into some way to replace my current scripts with ones that use `inotifywait` to see if that has any effect.~~ i believe this has something to do with acpi. when i run `sudo udevadm control --log-priority=debug` and `journalctl -f` i see `ACPI group/action undefined: processor / LNXCPU:0x` which does not appear when im booted into ubuntu. i cannot figure out why this happens.
- the `xset s off` and `xset -dpms` commands seem to not always run and i can't figure out why. i have them in both .xinitrc or bspwmrc. the last command in bspwmrc has a similar problem, although that might be slightly more complex.
- the bluetooth bar module will always report "Powered" on boot or when waking from suspend, which is very much not the case. i cannot figure out why this happens or how to fix it. im currently working around this by [turning bluetooth on and off again](https://askubuntu.com/a/1146734)

## kinnie rice

![screenshot](/Pictures/Screenshots/2022-07/Screenshot-20220710-151732.png)

(anything not listed is the same as the regular rice, which is a lot apparently)

- distro: [ubuntu studio](https://ubuntustudio.org) installed on top of a minimal [ubuntu 22.04](https://ubuntu.com)
- wm: [i3](https://github.com/Airblader/i3)
- bar uses scripts from .scripts/i3blocks

this installation is designed for me to simply open up mixxx and do a funky lil dj set. i do not trust it with anything else. still had to make it look pretty tho :)

### known issues

- i think i managed to clear up all the known issues today look at me go
- most things related to this partition have a filename prefixed by `i3`. this is not entirely consistent and may change in the future
- battery script does not show charging state but im not particularly worried about that rn
