#!/bin/bash

# Screenshot filename with timestamp
filename="$HOME/Pictures/Screenshots/screenshot_$(date +'%Y-%m-%d_%H-%M-%S').jpg"

# Create folder if it doesn't exist
mkdir -p "$(dirname "$filename")"

# Take screenshot of selected region, save to file
slurp | grim -g - "$filename"

# Copy to clipboard
wl-copy < "$filename"

