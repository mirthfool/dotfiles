#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias ff='fastfetch'

alias wall='$HOME/.config/scripts/wallpaper.sh'

alias tm='/home/mirth/.config/scripts/tmux-sessions.sh'


eval "$(fzf --bash)"

PS1='\u@\h[\W]$ '
alias dotfiles='/usr/bin/git --git-dir=/home/mirth/.dotfiles/ --work-tree=/home/mirth'
. "$HOME/.cargo/env"
