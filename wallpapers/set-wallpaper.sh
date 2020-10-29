#!/bin/bash
png=($HOME/wallpapers/*.png)
jpg=($HOME/wallpapers/*.jpg)
files=("${png[@]}" "${jpg[@]}") # create an array of files
rand=${files[$RANDOM % ${#files[@]}]}
feh --bg-scale $rand
