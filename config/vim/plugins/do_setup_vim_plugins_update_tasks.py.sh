#!/bin/sh
mkdir -p "$HOME"/.vim/bundle &&
cd "$HOME"/.vim/bundle &&
rm -f tasks.py &&
ln -sn "$OLDPWD"/tasks.py
