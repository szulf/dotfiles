#!/usr/bin/bash

install() {
    sudo pacman -S --needed --noconfirm "$@"
}

uninstall() {
    sudo pacman -Rns --noconfirm "$@"
}

to_install=(
    base-devel git 
    qutebrowser python-adblock
    ghostty
    mpv yt-dlp ffmpeg
    python
    neovim wl-clipboard
    unzip
)

to_uninstall=(
    kitty
)

install ${to_install[@]}
uninstall ${to_uninstall[@]}

if [ ! -d ~/installs/paru ]; then
    curr_dir="$(pwd)"
    cd ~/installs
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd $curr_dir
fi
