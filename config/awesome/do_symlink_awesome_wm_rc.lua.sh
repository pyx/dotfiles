#!/bin/sh
mkdir -p "$HOME"/.config/awesome/ &&
cd "$HOME"/.config/awesome/ &&
rm -f rc.lua &&
ln -sn "$OLDPWD"/rc.lua
