#!/bin/sh
mkdir -p "$HOME"/.scripts/ &&
cd "$HOME"/.scripts/ &&
rm -f start-i3.sh &&
ln -sn "$OLDPWD"/start-i3.sh &&
echo "please make $HOME/.background a copy or symlink to your favorite wallpaper"
