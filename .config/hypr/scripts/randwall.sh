#!/usr/bin/env bash

random_wall=$(find "$HOME/Pictures/walls" -type f | shuf -n 1)
filename=$(basename "$random_wall")

notify-send "$filename"

swww img "$random_wall" --transition-type any --transition-fps 60
