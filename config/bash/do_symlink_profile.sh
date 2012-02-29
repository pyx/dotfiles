#!/bin/sh
cd $HOME &&
rm -f .bash_profile &&
ln -sn "$OLDPWD/.bash_profile"
