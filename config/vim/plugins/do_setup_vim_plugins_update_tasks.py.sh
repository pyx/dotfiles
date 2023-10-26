#!/bin/sh
mkdir -p "$HOME"/.vim/pack/plugins/start &&
cd "$HOME"/.vim/pack/plugins/start &&
rm -f tasks.py &&
ln -sn "$OLDPWD"/tasks.py
mkdir -p "$HOME"/.vim/pack/colors/opt &&
cd "$HOME"/.vim/pack/colors/opt &&
rm -f tasks.py &&
ln -sn "$OLDPWD"/tasks.py
