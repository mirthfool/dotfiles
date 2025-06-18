#!/bin/sh

if swaymsg -t get_outputs | grep -q '"name": "HDMI-A-1"'; then
  swaymsg output eDP-1 disable
  swaymsg output HDMI-A-1 enable
  swaymsg output HDMI-A-1 resolution 2560x1440 pos 0 0
else
  swaymsg output eDP-1 enable
  swaymsg output eDP-1 scale 1 pos 0 0
fi

