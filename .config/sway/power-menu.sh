#!/bin/bash

# Power menu options
options="⏻ Shutdown\n Reboot\n Suspend\n Logout"

# Show the menu
choice=$(echo -e "$options" | fuzzel --dmenu --prompt="Power Menu:")

case "$choice" in
    *Shutdown*)
        systemctl poweroff
        ;;
    *Reboot*)
        systemctl reboot
        ;;
    *Suspend*)
        systemctl suspend
        ;;
    *Logout*)
        swaymsg exit
        ;;
esac

