#!/bin/sh
mkdir -p "$HOME"/.vim/syntax &&
cd "$HOME"/.vim/syntax/ &&
rm -f htmljinja.vim &&
ln -sn "$OLDPWD"/htmljinja.vim
