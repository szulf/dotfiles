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
    zsh
    waybar
    noto-fonts-emoji noto-fonts-cjk ttf-font-awesome
)

to_install_aur=(
    spotify
    oh-my-posh
)

to_uninstall=(
    kitty
)

install ${to_install[@]}
uninstall ${to_uninstall[@]}

# install paru
if [ ! -d ~/installs/paru ]; then
    curr_dir="$(pwd)"
    cd $HOME/installs
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd $curr_dir
fi

install_aur ${to_install_aur[@]}
