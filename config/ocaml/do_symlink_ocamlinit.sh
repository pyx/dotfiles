#!/bin/sh
cd "$HOME" &&
rm -f .ocamlinit &&
ln -sn "$OLDPWD"/.ocamlinit
