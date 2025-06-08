files=(
    zsh
    nvim
    alacritty
    clang-format
    git
    i3
    oh-my-posh
    tmux
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
