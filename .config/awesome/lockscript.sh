#!/bin/sh

exec xautolock -detectsleep \
  -time 3 -locker "i3lock -i /home/nunziocicone/.config/awesome/mountainwallpaperblur.png" \
  -notify 15 \
  -notifier "notify-send -u critical -t 10000 -- 'Locking screen...'"
