#!/bin/sh
mkdir -p "$HOME"/.vim/syntax &&
cd "$HOME"/.vim/syntax/ &&
rm -f jinja2.vim &&
ln -sn "$OLDPWD"/jinja2.vim
