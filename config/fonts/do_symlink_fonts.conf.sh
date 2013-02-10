#!/bin/sh
mkdir -p "$HOME"/.config/fontconfig/ &&
cd "$HOME"/.config/fontconfig/ &&
rm -f fonts.conf &&
ln -sn "$OLDPWD"/fonts.conf
