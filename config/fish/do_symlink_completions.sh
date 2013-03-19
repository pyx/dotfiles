#!/bin/sh
mkdir -p "$HOME"/.config/fish/ &&
cd "$HOME"/.config/fish/ &&
# assuming this is a symlink
rm -f completions &&
ln -sn "$OLDPWD"/completions
