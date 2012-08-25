#!/bin/sh
mkdir -p "$HOME/.vim/bundle" &&
cd "$HOME/.vim/bundle" &&
rm -f fabfile.py &&
ln -sn "$OLDPWD/fabfile.py"
