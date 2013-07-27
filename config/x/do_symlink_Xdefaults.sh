#!/bin/sh
cd "$HOME" &&
rm -f "$HOME"/.Xdefaults &&
ln -sn "$OLDPWD"/.Xdefaults
