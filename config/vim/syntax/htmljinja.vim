" Vim syntax file
" Language:	HTMLJinja
" Maintainer:	n/a
" Last Change:	2012 Mar 05

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the Jinja syntax to start with
if version < 600
  so <sfile>:p:h/jinja.vim
else
  runtime! syntax/jinja.vim
  unlet b:current_syntax
endif

let b:current_syntax = "htmljinja"

" vim: ts=8
