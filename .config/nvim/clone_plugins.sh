#!/bin/bash
mkdir -p "$HOME/.config/nvim/pack/plugins/start"

if [[ ! -f "plugins.txt" ]]; then
  echo "Error: plugin list not found!"
  exit 1
fi

cd "$HOME/.config/nvim/pack/plugins/start" || exit 1

while read -r plugin; do
    name=$(basename "$plugin" .git)
    if [ ! -d "$name" ]; then
        git clone "$plugin"
    else
        echo "$name already installed."
    fi
done < "$HOME/.config/nvim/plugins.txt"
