#!/bin/sh
cd "$HOME" &&
rm -f .tmux.conf &&
ln -sn "$OLDPWD"/.tmux.conf
