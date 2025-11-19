#!/usr/bin/env bash

# Name of the laptop internal display
LAPTOP_MONITOR="eDP-1"

# Get a list of connected outputs excluding the laptop screen
EXTERNAL_MONITORS=($(wlr-randr | grep -E '^[a-zA-Z0-9-]+ ".*"' | grep -v '^eDP-1 ' | awk '{print $1}'))

if [[ -n "$EXTERNAL_MONITORS" ]]; then
    wlr-randr --output "$LAPTOP_MONITOR" --off
else
    wlr-randr --output "$LAPTOP_MONITOR" --on
fi

