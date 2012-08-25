#!/bin/sh
cd "$HOME" &&
rm -f .vimrc .gvimrc &&
ln -sn "$OLDPWD"/.vimrc &&
ln -sn "$OLDPWD"/.gvimrc &&
echo "please read $HOME/.vimrc for required plugin-list"
