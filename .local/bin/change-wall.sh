#!/usr/bin/env bash

WALLS_DIR="$HOME/Pictures/walls"
HYPRLOCK_CONFIG="$HOME/.config/hypr/hyprlock.conf"

SELECTED_IMG=$(fd . "$WALLS_DIR" -e png -e gif -e jpg | while read a; do echo -en "$a\0icon\x1f$a\n"; done | rofi -dmenu -theme ~/.config/rofi/menu/wallpaper-select.rasi)

if [[ -n "$SELECTED_IMG" ]]; then
    wal -i "$SELECTED_IMG" -n -t -q -b '#090A09'
    matugen image $SELECTED_IMG

    sed -i "s|path = .*|path = $SELECTED_IMG|" "$HYPRLOCK_CONFIG"

    source ~/.cache/wal/colors.sh
    sed -i "/gradient_color_1/c\gradient_color_1 = '$color1'" ~/.config/cava/config
    sed -i "/gradient_color_2/c\gradient_color_2 = '$color2'" ~/.config/cava/config
    sed -i "/gradient_color_3/c\gradient_color_3 = '$color3'" ~/.config/cava/config
    sed -i "/gradient_color_4/c\gradient_color_4 = '$color4'" ~/.config/cava/config
    sed -i "/gradient_color_5/c\gradient_color_5 = '$color5'" ~/.config/cava/config
    sed -i "/gradient_color_6/c\gradient_color_6 = '$color6'" ~/.config/cava/config

    pkill -USR2 cava
    pkill -SIGUSR1 kitty

    ags quit -i Xebec
    ags run $HOME/dotfiles/.config/xebec

fi
