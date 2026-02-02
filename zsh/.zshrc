# Lines configured by zsh-newuser-install
HISTFILE=~/.zshhistfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PS1="[%B%F{#b3969e}%n@%m%f%b %F{#93975a}%1~%f] "

alias hx="helix"
alias vim="nvim"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias pacman="pacman --color=auto"
alias clang="clang -fcolor-diagnostics"
alias clang++="clang++ -fcolor-diagnostics"

# only autofill(up-arrow) things that match input
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Ctrl-X Ctrl-E to edit current line in EDITOR
export EDITOR=nvim
autoload edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

export GTEST_COLOR=1

zstyle ':completion:*' list-colors \
  'di=34'       \
  'ex=32'       \
  'ln=35'       \
  'pi=33'       \
  'so=36'       \
  'bd=33'       \
  'cd=33'       \
  'su=37'       \
  'sg=30'       \
  'tw=34'       \
  'ow=34'       \
  'st=37'

export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/installs"
export PATH="$PATH:$HOME/projects/dotfiles/bin"
export PATH="$PATH:$HOME/.config/emacs/bin"
export PATH="$PATH:$HOME/"

export FZF_DEFAULT_OPTS="--color=16"

export HELIX_RUNTIME="/usr/lib/helix/runtime"
