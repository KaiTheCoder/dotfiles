# Created by newuser for 5.8

autoload -Uz compinit; compinit
autoload -U colors && colors

PS1="%K{#F2CDCD}%F{#1E1E2E}%~%k%F{#F2CDCD} "
zstyle ':completion:*' menu select

source ~/path/to/fsh/fast-syntax-highlighting.plugin.zsh

alias s="sudo pacman -S"
alias r="sudo pacman -R"
alias remove="sudo pacman -Rs"
alias update="sudo pacman -Syu"
alias py="python3"
alias config='git --git-dir=$HOME/.cfg/.git/ --work-tree=$HOME'
