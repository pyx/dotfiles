#!/bin/sh
if [ -e "$HOME/.msmtprc" ]; then
  echo "you have $HOME/.msmtprc set up already, nothing to be done."
  exit 0
else
  cp .msmtprc $HOME/.msmtprc &&
  chmod 0600 $HOME/.msmtprc &&
  echo "copied msmtp rc file template to $HOME/.msmtprc, change the file as needed."
fi
