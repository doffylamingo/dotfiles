#!/usr/bin/env bash

WALLS_DIR="$HOME/Pictures/walls"

SELECTED_IMG=$(fd . "$WALLS_DIR" -e png -e gif -e jpg | fzf --preview='kitty icat --clear --transfer-mode=memory --stdin=no --place=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0 {}')

if [[ -n "$SELECTED_IMG" ]]; then
    swww img "$SELECTED_IMG" --transition-fps 60 --resize fit
fi
