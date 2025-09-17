#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTSTIZE=

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias wall='$HOME/.config/scripts/wallpaper.sh'

alias tm='$HOME/.config/scripts/tmux-sessions.sh'

source $HOME/.config/scripts/fzf_vague.sh

eval "$(fzf --bash)"

PS1='\u@\h[\W]$ '
alias dotfiles='/usr/bin/git --git-dir=/home/mirth/.dotfiles/ --work-tree=/home/mirth'
. "$HOME/.cargo/env"
