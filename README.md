# lily's laptop dotfiles


i should note before saying anything else that these files probably suck please do not hesitate to grill me in the issues (i hope people can actually open issues idk if i've used git correctly)

this repo houses two different rices. i dual-boot arch and ubuntu (studio) on this laptop bc ~~im an idiot~~ doing regular tasks is painfull slow without threading and mixxx demands i don't use threading. these rices will be referred to as "regular" and "kinnie" respectively. a lot of config is shared but i'll list them out as if they weren't.

## regular rice

![screenshot](/Pictures/Screenshots/2022-05/Screenshot-20220525-152701.png)

- distro: [arch](https://archlinux.org)
- wm: [bspwm](https://github.com/baskerville/bspwm)
- compositor: [picom](https://github.com/yshui/picom)
- terminal: [luke smith's build of st](https://github.com/LukeSmithxyz/st) (i would try patching and building it myself but it never works out for me)
- shell: [zsh](https://www.zsh.org)
  - zsh plugins: [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) and [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
  - prompt: [starship](https://starship.rs) (this may not last im trying to get st to change its title and i think starship is making that more difficult than it needs to be)
- bar: [succade](https://github.com/domsson/succade) (i really should learn how to use regular lemonbar at some point)
  - bar uses scripts from .scripts directory. i believe said scripts should be using dash instead of zsh.
- notifs: [dunst](https://github.com/dunst-project/dunst)
- editor: [vim](https://www.vim.org/) (im very new to vim feel free to convince me to use anything else)
  - vim plugins: [vim-airline](https://github.com/vim-airline/vim-airline) (idr what theme im using it's one of the 16-colour ones)
- wallpaper: made by my good friend [emile toaster\_chan\_](https://twitter.com/toaster_chan_) (commission emile)

this is the distro i spend most of my time on my laptop in. it's a rather bad laptop so i've mad it as minimal as i possibly can with my current knowledge. please feel free to ask me about whatever's going on in here and also suggest ways in which i can do better.

## kinnie rice

(screenshot coming soon)

(anything not listed is the same as the regular rice, which is a lot apparently)

- distro: [ubuntu studio](https://ubuntustudio.org) installed on top of a minimal [ubuntu 22.04](https://ubuntu.com)
- wm: [i3](https://github.com/Airblader/i3)
- bar: [i3blocks](https://github.com/vivien/i3blocks)
  - this is still largely unfinished i'll upload the scripts and config at some point later

this installation is designed for me to simply open up mixxx and do a funky lil dj set. i do not trust it with anything else. still had to make it look pretty tho :)
