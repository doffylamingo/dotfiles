#!/usr/bin/env bash

shutdown="Shutdown"
reboot="Reboot"
lock="Lock"
logout="Log out"

options="$shutdown\n$lock\n$logout\n$reboot"

chosen="$(echo -e "$options" | rofi -p "" -dmenu -theme $HOME/.config/rofi/themes/powermenu.rasi)"

case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        hyprlock
        ;;
    $logout)
        sleep 1; hyprctl dispatch exit
        ;;
esac
