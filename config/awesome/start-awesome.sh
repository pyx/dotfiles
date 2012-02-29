#!/bin/sh
nm-applet &
# -or-
#wicd-gtk --tray  &
ibus-daemon -d -x -r
xcompmgr -c &
conky &
/usr/bin/volumeicon &
xsetroot -cursor_name left_ptr
# make this a symlink to your favorite wallpaper
awsetbg -a ~/.background
