#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers/"
kill swaybg
WALLPAPER=$(find "$WALLPAPER_DIR" | shuf -n 1)

swaybg -m fit -i "$WALLPAPER"
