#!/usr/bin/env bash

WALLS_DIR="$HOME/Pictures/walls"
HYPRLOCK_CONFIG="$HOME/.config/hypr/hyprlock.conf"

SELECTED_IMG=$(fd . "$WALLS_DIR" -e png -e gif -e jpg | while read a; do echo -en "$a\0icon\x1f$a\n"; done | rofi -dmenu -theme ~/.config/rofi/menu/wallpaper-select.rasi)

if [[ -n "$SELECTED_IMG" ]]; then
    swww img --transition-type any --transition-step 255 --transition-fps 60 $SELECTED_IMG

    sed -i "s|path = .*|path = $SELECTED_IMG|" "$HYPRLOCK_CONFIG"
fi
