#!/bin/bash
rm $HOME/wallpapers/current.png
files=(~/wallpapers/*) # create an array of files
rand=${files[$RANDOM % ${#files[@]}]}
cp $rand $HOME/wallpapers/current.png
feh --bg-scale $HOME/wallpapers/current.png
