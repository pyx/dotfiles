#!/bin/sh
cd "$HOME" &&
rm -f .i3status.conf &&
ln -sn "$OLDPWD"/.i3status.conf
