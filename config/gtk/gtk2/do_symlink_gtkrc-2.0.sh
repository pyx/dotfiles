#!/bin/sh
cd "$HOME" &&
rm -f .gtkrc-2.0 &&
ln -sn "$OLDPWD"/.gtkrc-2.0 &&
echo "using $HOME/.theme/default/gtk-2.0/gtkrc as default style, please symlink this to the one you like"
