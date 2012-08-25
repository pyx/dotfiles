#!/bin/sh
cd "$HOME" &&
rm -f .fonts.conf &&
ln -sn "$OLDPWD"/.fonts.conf
