#!/bin/ksh
set -A files $(ag -g png --ignore current.png) # create an array of files
N=${#files[@]}         # Number of members in array
((N=RANDOM%N))
cp ${files[$N]} current.png
feh --bg-fill /home/ncicone/wallpapers/current.png
