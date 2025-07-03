#!/usr/bin/env bash

WALLS_DIR="$HOME/Pictures/walls"
HYPERPANEL_CONFIG="$HOME/.config/hyprpanel/config.json"

SELECTED_IMG=$(fd . "$WALLS_DIR" -e png -e gif -e jpg | fzf --preview='kitty icat --clear --transfer-mode=memory --stdin=no --place=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0 {}')

if [[ -n "$SELECTED_IMG" ]]; then
    hyprpanel sw "$SELECTED_IMG"
    
    if [[ -f "$HYPERPANEL_CONFIG" ]]; then
        jq --arg img "$SELECTED_IMG" '.["wallpaper.image"] = $img' "$HYPERPANEL_CONFIG" > "$HYPERPANEL_CONFIG.tmp" && mv "$HYPERPANEL_CONFIG.tmp" "$HYPERPANEL_CONFIG"
    fi
    
    hyprpanel ut $HYPERPANEL_CONFIG
fi
