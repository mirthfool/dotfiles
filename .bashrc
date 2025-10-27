#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTSTIZE=

export FZF_DEFAULT_OPTS="
  --color=fg:#D8DEE9,bg:#2E3440,hl:#88C0D0 \
  --color=fg+:#ECEFF4,bg+:#3B4252,hl+:#8FBCBB \
  --color=info:#81A1C1,prompt:#A3BE8C,pointer:#BF616A \
  --color=marker:#EBCB8B,spinner:#B48EAD,header:#5E81AC
"

alias ls='ls -C --color=auto'
alias grep='grep --color=auto'

alias wall='$HOME/.config/scripts/wallpaper.sh'

alias tm='$HOME/.config/scripts/tmux-sessions.sh'

eval "$(fzf --bash)"

PS1='\u@\h[\W]$ '
alias dotfiles='/usr/bin/git --git-dir=/home/mirth/.dotfiles/ --work-tree=/home/mirth'
. "$HOME/.cargo/env"
