#!/bin/sh
cd $HOME &&
rm -f .vimperatorrc &&
ln -sn "$OLDPWD/.vimperatorrc" &&
echo "you can add local customization to $HOME/.vimperatorrc.local"
