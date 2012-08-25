#!/bin/sh
cd "$HOME" &&
rm -f .bashrc &&
ln -sn "$OLDPWD"/.bashrc
