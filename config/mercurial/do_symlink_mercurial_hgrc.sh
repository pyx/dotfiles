#!/bin/sh
cd $HOME &&
rm -f .hgrc &&
ln -sn "$OLDPWD/.hgrc"
