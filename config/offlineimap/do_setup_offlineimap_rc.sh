#!/bin/sh
if [ -e "$HOME"/.offlineimaprc ]; then
  echo "you have $HOME/.offlineimaprc set up already, nothing to be done."
  exit 0
else
  cp .offlineimaprc "$HOME"/.offlineimaprc &&
  chmod 0600 "$HOME"/.offlineimaprc &&
  echo "copied offlineimap rc file template to $HOME/.offlineimaprc, change the file as needed. you may want to restrict access to you maildir as well, something like chmod 0700 'YOU-MAILDIR'."
fi
