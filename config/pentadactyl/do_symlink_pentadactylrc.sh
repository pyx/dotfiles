#!/bin/sh
cd $HOME &&
rm -f .pentadactylrc &&
ln -sn "$OLDPWD/.pentadactylrc" &&
echo "you can add local customization to $HOME/.pentadactylrc.local"
