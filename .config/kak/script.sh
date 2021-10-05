#!/bin/sh
# A script for systemd to launch kakoune

# On Ubuntu 20.10 I needed to add a systemd X11 script for xsel to work
# read more at https://wiki.archlinux.org/title/systemd/User#DISPLAY_and_XAUTHORITY
kak -d -s main
