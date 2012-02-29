#!/bin/sh
mkdir -p $HOME/.scripts/ &&
cd $HOME/.scripts/ &&
rm -f virtualenv-helpers.sh &&
ln -sn "$OLDPWD/virtualenv-helpers.sh"
