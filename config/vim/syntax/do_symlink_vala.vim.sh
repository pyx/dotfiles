#!/bin/sh
mkdir -p "$HOME"/.vim/syntax &&
cd "$HOME"/.vim/syntax/ &&
rm -f vala.vim &&
ln -sn "$OLDPWD"/vala.vim
