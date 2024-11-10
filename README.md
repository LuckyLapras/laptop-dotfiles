# lily's laptop dotfiles

i should note before saying anything else that these files probably suck please do not hesitate to grill me in the issues (i hope people can actually open issues idk if i've used git correctly)

this repo houses two different rices: regular and kinnie


## regular rice

![screenshot](/Pictures/Screenshots/Demo/regular.png)

- distro: [arch](https://archlinux.org)
- wm: [bspwm](https://github.com/baskerville/bspwm)
- compositor: [fastcompmgr](https://github.com/tycho-kirchner/fastcompmgr) (should also note that this requires git versions of xorg and its dependencies for anti-tearing using the modesetting driver. but u probably knew that anyway)
- terminal: [luke smith's build of st](https://github.com/LukeSmithxyz/st) (i would try patching and building it myself but it never works out for me)
  - colour scheme: lily original :)
- shell: [zsh](https://www.zsh.org)
  - zsh plugins: [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) and [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
  - prompt: [powerlevel10k](https://github.com/romkatv/powerlevel10k)
    - powerlevel10k rainbow theme slightly edited
- bar: [succade](https://github.com/domsson/succade) (i really should learn how to use regular lemonbar at some point)
  - bar uses scripts from .scripts/blocks directory. i believe said scripts should be using dash instead of zsh. (with the exception of the workspaces script, which seems to break under dash)
- notifs: [dunst](https://github.com/dunst-project/dunst)
- editor: [vim](https://www.vim.org/)
  - vim plugins: [vim-airline](https://github.com/vim-airline/vim-airline)
    - airline theme: a small modification of [base16\_vim](https://github.com/vim-airline/vim-airline/blob/master/autoload/airline/themes/dark.vim)
- wallpaper: made by my good friend [emile catboy\_milky](https://twitter.com/catboy_milky) (commission emile)
- rofi themes: text launcher and android powermenu adapted from [adi1090x](https://github.com/adi1090x/rofi)
- font: [cozette](https://github.com/slavfox/Cozette)

### known issues

- the battery script causes a huge cpu spike when (dis)connecting the charger ~~(although that might just be bc my cpu's bad). im looking into some way to replace my current scripts with ones that use `inotifywait` to see if that has any effect.~~ i believe this has something to do with acpi. when i run `sudo udevadm control --log-priority=debug` and `journalctl -f` i see `ACPI group/action undefined: processor / LNXCPU:0x` which does not appear when im booted into ubuntu. i cannot figure out why this happens.
 - after a fresh reinstall this still persists but is nowhere near as bad. old installation had a spike of ~80%, new only ~50%. im thinking this may be an unavoidable issue
- the bluetooth bar module will always report "Powered" on boot or when waking from suspend, which is very much not the case. i cannot figure out why this happens or how to fix it. im currently working around this by [turning bluetooth on and off again](https://askubuntu.com/a/1146734)

## kinnie rice

![screenshot](/Pictures/Screenshots/Demo/kinnie.png)

(anything not listed is the same as the regular rice, which is a lot apparently)

- wm: [i3](https://github.com/Airblader/i3)
- bar uses scripts from .scripts/i3blocks

### known issues

- most things related to this partition have a filename prefixed by `i3`. this is not entirely consistent and may change in the future
- battery script does not show charging state but im not particularly worried about that rn
