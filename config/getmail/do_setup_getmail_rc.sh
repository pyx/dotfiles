#!/bin/sh
if [ -d "$HOME"/.getmail/ ]; then
  echo "you have $HOME/.getmail set up already, nothing to be done."
  exit 0
else
  mkdir -m 0700 "$HOME"/.getmail &&
  cp getmailrc "$HOME"/.getmail/ &&
  chmod 0600 "$HOME"/.getmail/getnailrc &&
  echo "copied getmail rc file template into $HOME/.getmail/, change the file as needed."
fi
