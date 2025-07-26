#!/usr/bin/env bash

TRACKID="$(playerctl metadata mpris:trackid)"
ARTURL="$(playerctl metadata mpris:artUrl)"
IMG=/tmp/album-cover.png

get_cover() {
  wget -q "$(playerctl metadata mpris:artUrl)" -O "$IMG"
  kitten icat "$IMG"
}

clear
get_cover

while true; do
  NEW_ARTURL="$(playerctl metadata mpris:artUrl)"
  if [[ "$ARTURL" == "$NEW_ARTURL" ]]; then
    sleep 2
  else
    clear
    get_cover
    ARTURL="$NEW_ARTURL"
  fi
done
