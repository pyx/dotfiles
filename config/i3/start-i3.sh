#!/bin/sh
#nm-applet &
# -or-
dunst &
connman-gtk --tray &
ibus-daemon -d -x -r
xcompmgr -cC &
conky &
/usr/bin/volumeicon &
xsetroot -cursor_name left_ptr
# Caps Lock as Control, clear with: setxkbmap -option ''
setxkbmap -option ctrl:nocaps
# make this a symlink to your favorite wallpaper
feh --bg-max ~/.background.0 ~/.background.1
