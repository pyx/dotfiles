#!/bin/sh
mkdir -p "$HOME"/.scripts/ &&
cd "$HOME"/.scripts/ &&
rm -f virtualenv-helpers.fish &&
ln -sn "$OLDPWD"/virtualenv-helpers.fish
