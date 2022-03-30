# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
alias tmuxs="tmux -u new -s"
alias tmuxt="tmux -u attach -t"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
