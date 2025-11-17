#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTSTIZE=

export FZF_DEFAULT_OPTS="
  --color=fg:#c5c9c7,bg:#23262d,hl:#8ba4b0 \
  --color=fg+:#c5c9c7,bg+:#43464e,hl+:#7fb4ca \
  --color=info:#72a7bc,prompt:#8a9a7b,pointer:#c4746e \
  --color=marker:#c4b28a,spinner:#938aa9,header:#a292a3
"

set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

export EDITOR="/usr/bin/nvim"

alias ls='ls -C --color=auto'
alias grep='grep --color=auto'

alias wall='$HOME/.config/scripts/wallpaper.sh'

alias tm='$HOME/.config/scripts/tmux-sessions.sh'

eval "$(fzf --bash)"

PS1='\u@\h[\W]$ '
alias dotfiles='/usr/bin/git --git-dir=/home/mirth/.dotfiles/ --work-tree=/home/mirth'
. "$HOME/.cargo/env"
