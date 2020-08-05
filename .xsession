#!/bin/sh
LC_CTYPE="en_US.UTF-8"
xrdb -load /home/ncicone/.Xresources
xmodmap /home/ncicone/.xmodmapsettings 
feh --bg-fill /home/ncicone/wallpapers/current.png
apmd -A
urxvtd -q -f -o
sxhkd &
exec spectrwm
