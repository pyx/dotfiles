#!/bin/sh
mkdir -p "$HOME"/.config/gtk-3.0/ &&
cd "$HOME"/.config/gtk-3.0/ &&
rm -f settings.ini &&
ln -sn "$OLDPWD"/settings.ini
