#!/bin/bash

# Path to your wallpapers folder
WALLPAPER_DIR="$HOME/.config/Wallpapers"

# File to remember last wallpaper
LAST_FILE="$HOME/.cache/last_wallpaper.txt"

# Pick a random file
while true; do
    FILE=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

    # If last file exists and matches current pick, retry
    if [[ -f "$LAST_FILE" ]] && [[ "$FILE" == "$(cat "$LAST_FILE")" ]]; then
        continue
    fi

    break
done

# Set it as wallpaper (GNOME)
gsettings set org.gnome.desktop.background picture-uri "file://$FILE"
gsettings set org.gnome.desktop.background picture-uri-dark "file://$FILE"

# Save choice for next time
echo "$FILE" > "$LAST_FILE"

