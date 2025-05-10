#!/usr/bin/bash

install() {
    sudo pacman -Sy --needed --noconfirm "$@"
}

install_aur() {
    paru -Sy --needed --noconfirm "$@"
}

uninstall() {
    for item in "$@"; do
        sudo pacman -Rns --noconfirm $item
    done
}

to_install=(
    base-devel git
    qutebrowser python-adblock
    ghostty
    mpv yt-dlp ffmpeg
    python
    neovim wl-clipboard
    unzip btop ripgrep
    zsh
    waybar hyprpaper rofi
    noto-fonts-emoji noto-fonts-cjk ttf-font-awesome
    gimp
    pavucontrol
    nautilus
)

to_install_aur=(
    spotify
    oh-my-posh
    wlogout
)

to_uninstall=(
    kitty
    wofi
    dolphin
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
