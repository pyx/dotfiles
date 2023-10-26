#!/bin/sh
mkdir -p "$HOME"/.vim/pack/colors/opt &&
cd "$HOME"/.vim/pack/colors/opt &&
rm -rf */ &&
grep -E '^" C (hg|git)' "$HOME"/.vimrc | cut --bytes=5- | sh
