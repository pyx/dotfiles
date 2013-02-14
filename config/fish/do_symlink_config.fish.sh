#!/bin/sh
mkdir -p "$HOME"/.config/fish/ &&
cd "$HOME"/.config/fish/ &&
rm -f config.fish &&
ln -sn "$OLDPWD"/config.fish
