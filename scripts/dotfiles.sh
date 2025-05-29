#!/usr/bin/bash

copy_if_changed() {
    diff -r $1 $2 > /dev/null
    status=$?

    if [ $status == 0 ]; then
        echo "'$2' is up to date"

        return 1
    else
        echo "removing '$2'"
        rm -r $2
        echo "copying '$1' into '$2'"
        cp -r $1 $2

        return 0
    fi
}

sudo_copy_if_changed() {
    sudo diff -r $1 $2 > /dev/null
    status=$?

    if [ $status == 0 ]; then
        echo "'$2' is up to date"

        return 1
    else
        echo "removing '$2'"
        sudo rm -r $2
        echo "copying '$1' into '$2'"
        sudo cp -r $1 $2

        return 0
    fi
}

run_with_sudo=false

while getops ":s" opt; do
    case ${opt} in s )
        run_with_sudo=true
        ;;
    /?)
        echo "Usage: $0 [-s]"
        exit 1
        ;;
    esac
done

shopt -s dotglob
cd cfgs/
for file in *; do
    if [ $file == ".zshrc" ] || [ $file == ".clang-format" ]; then
        copy_if_changed "./$file" "$HOME/$file"

    elif [ $file == "gtk-3.0" ]; then
        copy_if_changed "./$file" "$HOME/.themes/Catppuccin-Dark"

    elif [ $file == "sddm" ]; then
        if $run_with_sudo; then
            sudo_copy_if_changed "./$file/theme/" "/usr/share/sddm/themes/theme"
            sudo_copy_if_changed "./$file/sddm.conf" "/etc/sddm.conf"
        else
            echo "Skipping copying sddm, because it requires sudo. Use -s to enable it."
        fi

    else
        copy_if_changed "./$file" "$HOME/.config/$file"

        if [ "$file" == "hypr" ] && [ "$changed" == 0 ]; then
            hyprctl reload
        fi
    fi
done
