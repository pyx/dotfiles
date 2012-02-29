#!/bin/sh
cd $HOME &&
rm -f .conkyrc .hp.conkyrc &&
ln -sn "$OLDPWD/.conkyrc" &&
ln -sn "$OLDPWD/.hp.conkyrc"
