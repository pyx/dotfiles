#!/bin/sh
mkdir -p "$HOME"/.vim/pack/vendor/start &&
cd "$HOME"/.vim/pack/vendor/start &&
# assuming this is a symlink
rm -f misc &&
ln -sn "$OLDPWD"/misc
