#!/bin/sh
mkdir -p $HOME/.scripts/ &&
cd $HOME/.scripts/ &&
rm -f start-awesome.sh &&
ln -sn "$OLDPWD/start-awesome.sh" &&
echo "please make $HOME/.background a copy or symlink to your favorite wallpaper"
