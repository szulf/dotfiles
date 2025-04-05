#!/bin/bash

copy_if_changed() {
    cmp --silent $1 $2
    status=$?

    if [ $status == 0 ]; then
        echo "'$2' is up to date"
    else
        echo "copying '$1' into '$2'"
        cp $1 $2
    fi
}

copy_if_changed_dir() {
    find $1 -type f | while IFS= read -r file; do
        dest_file="$2/${file#$1/}"
        copy_if_changed "$file" "$dest_file"
    done
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
        copy_if_changed_dir "./$file" "/home/$USER/.config/$file"
    fi
done
