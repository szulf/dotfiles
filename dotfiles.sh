#!/bin/bash

# TODO(szulf): change this to a sh script instead of a bash script

files=(
    # alacritty
    clang-format
    git
    # helix
    i3
    nvim
    # tmux
    wezterm
    zed
    zsh
)

stowit() {
    usr=$1
    app=$2

    stow -v -R -t ${usr} ${app}
}

echo "-- START"
echo ""

for app in ${files[@]}; do
    stowit "${HOME}" $app
done

echo ""
echo "-- DONE"
