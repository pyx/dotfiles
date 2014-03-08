#!/bin/sh
mkdir -p "$HOME"/.vim/bundle &&
cd "$HOME"/.vim/bundle &&
# assuming this is a symlink
rm -f misc &&
ln -sn "$OLDPWD"/misc
