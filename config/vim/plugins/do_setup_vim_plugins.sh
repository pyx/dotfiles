#!/bin/sh
mkdir -p "$HOME"/.vim/bundle &&
cd "$HOME"/.vim/bundle &&
rm -rf */ &&
grep -E '^" (hg|git|svn)' "$HOME"/.vimrc | cut --bytes=3- | sh &&
# assuming pathogen was installed. otherwise(vundle, maybe) we do't need this script.
mkdir -p "$HOME"/.vim/autoload &&
rm -f "$HOME"/.vim/autoload/pathogen.vim &&
ln -sn "$HOME"/.vim/bundle/vim-pathogen/autoload/pathogen.vim "$HOME"/.vim/autoload/pathogen.vim
