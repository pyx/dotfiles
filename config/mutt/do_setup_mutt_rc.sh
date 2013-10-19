#!/bin/sh
if [ -d "$HOME/.mutt/" ]; then
  echo "you have $HOME/.mutt set up already, nothing to be done."
  exit 0
else
  mkdir -m 0700 "$HOME"/.mutt &&
  cp users "$HOME"/.mutt/ &&
  cp alias "$HOME"/.mutt/ &&
  cp mailcap "$HOME"/.mutt/ &&
  cp bindings "$HOME"/.mutt/ &&
  cp macros "$HOME"/.mutt/ &&
  cp hooks "$HOME"/.mutt/ &&
  cp colors "$HOME"/.mutt/ &&
  cp gpg.rc "$HOME"/.mutt/ &&
  cp user.default "$HOME"/.mutt/user.default &&
  chmod 0600 "$HOME"/.mutt/* &&
  cd "$HOME"/.mutt/ &&
  ln -sn "$OLDPWD"/muttrc &&
  echo "copied mutt rc file templates into $HOME/.mutt/, change these files as needed."
fi
