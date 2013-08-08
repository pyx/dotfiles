#!/bin/sh
mkdir -p "$HOME"/.config/dunst/ &&
cd "$HOME"/.config/dunst/ &&
rm -f dunstrc &&
ln -sn "$OLDPWD"/dunstrc
