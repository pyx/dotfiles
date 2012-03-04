#!/bin/sh
mkdir -p $HOME/.vim &&
cd $HOME/.vim/ &&
# assuming this is a symlink
rm -f snippets &&
ln -sn "$OLDPWD/snippets"
