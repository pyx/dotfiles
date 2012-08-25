#!/bin/sh
cd "$HOME" &&
rm -f .ctags &&
ln -sn "$OLDPWD"/.ctags
