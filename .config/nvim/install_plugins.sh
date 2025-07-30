#!/bin/bash
mkdir -p "$HOME/.config/nvim/pack/plugins/start"
cd "$HOME/.config/nvim/pack/plugins/start"

while read -r plugin; do
    name=$(basename "$plugin" .git)
    if [ ! -d "$name" ]; then
        git clone "$plugin"
    else
        echo "$name already installed"
    fi
done < "$HOME/.config/nvim/plugins.txt"
