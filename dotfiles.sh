#!/bin/bash

copy_if_changed() {
    diff -r $1 $2 > /dev/null
    status=$?

    if [ $status == 0 ]; then
        echo "'$2' is up to date"
    else
        echo "copying '$1' into '$2'"
        rm -r $2
        cp -r $1 $2
    fi
}

for file in *; do
    if [ $file == "dotfiles.sh" ]; then
        continue
    fi

    if [ $file == "zshrc" ]; then
        copy_if_changed "./$file" "/home/$USER/.zshrc"
    elif [ $file == "mine.zsh-theme" ]; then
        copy_if_changed "./$file" "/home/$USER/.oh-my-zsh/custom/themes/$file"
    elif [ $file == "clang-format" ]; then
        copy_if_changed "./$file" "/home/$USER/.clang-format"
    elif [ -d $file ]; then
        copy_if_changed "./$file" "/home/$USER/.config/$file"
    fi
done
