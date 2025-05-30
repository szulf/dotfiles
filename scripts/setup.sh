#!/usr/bin/bash

# git setup
git config --global init.defaultBranch main

# set font
mkdir -p $HOME/.local/share/fonts/
cp ./assets/HurmitNerdFontMono-Regular.otf $HOME/.local/share/fonts/
fc-cache

# set zsh as default shell
if [ $SHELL != "/usr/bin/zsh" ]; then
    sudo chsh -s /usr/bin/zsh
fi

# set gtk-3.0 theme
gsettings set org.gnome.desktop.interface gtk-theme 'Catppuccin-Dark'

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
