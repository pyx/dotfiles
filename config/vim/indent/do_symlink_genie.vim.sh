#!/bin/sh
mkdir -p $HOME/.vim/indent &&
cd $HOME/.vim/indent/ &&
rm -f genie.vim &&
ln -sn "$OLDPWD/genie.vim"
