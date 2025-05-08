#!/usr/bin/bash

install() {
    sudo pacman -S --needed --noconfirm "$@"
}

install_aur() {
    paru -S --needed --noconfirm "$@"
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
    spotify
)

to_install_aur=(
    spotify
)

to_uninstall=(
    kitty
)

install ${to_install[@]}
install_aur ${to_install_aur[@]}
uninstall ${to_uninstall[@]}

if [ ! -d ~/installs/paru ]; then
    curr_dir="$(pwd)"
    cd ~/installs
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd $curr_dir
fi
