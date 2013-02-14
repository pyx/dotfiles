#!/bin/sh
mkdir -p "$HOME"/.config/fish/ &&
cd "$HOME"/.config/fish/ &&
# assuming this is a symlink
rm -f functions &&
ln -sn "$OLDPWD"/functions
