#!/bin/sh
mkdir -p "$HOME"/.i3/ &&
cd "$HOME"/.i3/ &&
rm -f config &&
ln -sn "$OLDPWD"/config
