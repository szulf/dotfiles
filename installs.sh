#!/usr/bin/bash

install() {
    sudo pacman -Sy --needed --noconfirm "$@"
}

install_aur() {
    paru -Sy --needed --noconfirm "$@"
}

uninstall() {
    for item in "$@"; do
        sudo pacman -Rns --noconfirm "$item"
    done
}

to_install=(
    base-devel git
    ghostty
    mpv yt-dlp ffmpeg
    python python-pip
    neovim wl-clipboard
    unzip btop ripgrep
    zsh
    waybar hyprpaper rofi
    noto-fonts-emoji noto-fonts-cjk ttf-font-awesome ttf-jetbrains-mono
    gimp
    pavucontrol
    nautilus
    cmake clang
    cloc
    fastfetch
    evince
    wine
    gdb
    mingw-w64
    qt6-svg qt6-declarative qt5-quickcontrols2
    wlr-randr
    nodejs npm
    dotnet-runtime-8.0 dotnet-sdk-8.0 aspnet-runtime-8.0
    dotnet-runtime dotnet-sdk aspnet-runtime
    fuse2 fuse3
    fd
    tmux
    lazygit
    fzf
)

to_install_aur=(
    spotify
    oh-my-posh
    wlogout
    brave-bin
    grimblast-git
)

to_uninstall=(
    kitty
    wofi
    dolphin
)

install "${to_install[@]}"
uninstall "${to_uninstall[@]}"

# install paru
if [ ! -d ~/installs/paru ]; then
    curr_dir="$(pwd)"
    cd "$HOME/installs"
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd "$curr_dir"
fi

install_aur "${to_install_aur[@]}"
