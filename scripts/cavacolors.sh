#!/usr/bin/env bash

update_cava_colors() {
    img_url="$1"
    config_file="$HOME/.config/cava/config"

    if [[ "$img_url" == file://* ]]; then
        img="${img_url#file://}"
    else
        img=$(mktemp --suffix=".jpg")
        wget "$img_url" -O "$img" -q
    fi

    numcol=6
    gradient_colors=($(magick "$img" -colors 6 -define histogram:unique-colors=true -format "%c" histogram:info: | grep -oP '#\w+'))
    
    for i in "${!gradient_colors[@]}"; do
        sed -i "s/^gradient_color_$((i+1)) = .*/gradient_color_$((i+1)) = '${gradient_colors[$((numcol-i-1))]}'/" "$config_file"
    done

    if [[ "$img_url" != file://* ]]; then
        rm "$img"
    fi
}

playerctl --follow metadata --format "{{mpris:artUrl}}" | while read -r new_img_url; do
    if [[ -n "$new_img_url" && "$new_img_url" != "$img_url" ]]; then
        update_cava_colors "$new_img_url"
	pkill -USR2 cava
    fi
    img_url="$new_img_url"
done
