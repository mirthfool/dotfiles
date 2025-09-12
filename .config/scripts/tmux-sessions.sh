#!/bin/bash

DIRS=(
    "$HOME/Documents"
    "$HOME"
    "$HOME/projects"
)

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find "${DIRS[@]}" -maxdepth 1 -type d 2>/dev/null \
        | sed "s|^$HOME/||" \
        | fzf --margin=10% --color=bw)

    [[ $selected ]] && selected="$HOME/$selected"
fi

[[ ! $selected ]] && exit 0

selected_name=$(basename "$selected" | tr . _)

if ! tmux has-session -t "$selected_name" 2>/dev/null; then
    tmux new-session -ds "$selected_name" -c "$selected"
    tmux select-window -t "$selected_name:1"
fi

if [[ -n $TMUX ]]; then
    tmux switch-client -t "$selected_name"
else
    exec tmux attach -t "$selected_name"
fi

