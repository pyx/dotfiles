#!/bin/sh
mkdir -p "$HOME"/.vim/pack/plugins/start &&
cd "$HOME"/.vim/pack/plugins/start &&
rm -rf */ &&
grep -E '^" P (hg|git)' "$HOME"/.vimrc | cut --bytes=5- | sh
