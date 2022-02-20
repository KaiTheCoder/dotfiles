# Created by newuser for 5.8

autoload -Uz vcs_info
precmd() { vcs_info }

autoload -Uz compinit; compinit
autoload -U colors && colors

zstyle ':vcs_info:git:*' formats ' %b'
setopt PROMPT_SUBST 
#RPROMPT=%F{#1E1E2E}%K{#d3869b}%F{#1E1E2E}\$vcs_info_msg_0_ 

PROMPT='%K{#1d2021}%F{#83a598}%n%f in %F{#d3869b}%~%f at %F{#fabd2f}${vcs_info_msg_0_}%k
 '
zstyle ':completion:*' menu select

source ~/path/to/fsh/fast-syntax-highlighting.plugin.zsh

export PYTHONPATH="$PYTHONPATH:/home/kaysar/python-projects/pong_but_better/classes"

alias s="sudo pacman -S"
alias r="sudo pacman -R"
alias remove="sudo pacman -Rs"
alias update="sudo pacman -Syu"
alias py="python3"
alias config='git --git-dir=$HOME/.cfg/.git/ --work-tree=$HOME'
alias tmuxs="tmux new -s"
alias tmuxt="tmux attach -t"

export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8
