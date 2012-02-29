#!/bin/sh
cd $HOME &&
rm -f $HOME/.gitconfig &&
ln -sn "$OLDPWD/.gitconfig"
