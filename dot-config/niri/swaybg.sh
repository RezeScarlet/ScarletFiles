#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/ScarletFiles/Pictures/Wallpapers/"

# Mata qualquer swaybg rodando
pkill swaybg

# Escolhe aleatoriamente uma imagem
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | shuf -n 1)

# Seta o novo wallpaper
swaybg -m fill -i "$WALLPAPER"

