" -*- vim: set sts=2 sw=2 et fdm=marker: -------------  vim modeline -*-
" [Pathogen] ------------------------------------------ {{{1
call pathogen#infect()

" Basic Settings -------------------------------------- {{{1
syntax on
set nocompatible
filetype plugin indent on

set hlsearch
set incsearch
set ruler
set showcmd
set title
set wildmenu
set wildmode=list:longest,list:full

set backup
set backupdir=~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.tmp//,~/tmp//,/var/tmp//,/tmp//

set backspace=indent,eol,start
set history=200

set fileencodings=ucs-bom,utf8,cp936,gbk,big5,euc-jp,euc-kr,gb18130,latin1

set dictionary+=/usr/share/dict/words

set grepprg=ack\ -a

if has('mouse')
  set mouse=a
endif

if has("gui_running")
"  set cursorcolumn
"  set cursorline
  set nowrap
  set relativenumber
  " set spell

  " Ctrl-F12 Toggle Menubar and Toolbar
  nnoremap <silent> <C-F12> :
    \ if &guioptions =~# 'T' <Bar>
      \ set guioptions-=T <Bar>
      \ set guioptions-=m <Bar>
    \ else <Bar>
      \ set guioptions+=T <Bar>
      \ set guioptions+=m <Bar>
    \ endif<CR>

  set guioptions-=T
  set guioptions-=m
endif

" Mark extra whitespaces in red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Status Line ----------------------------------------- {{{1
set laststatus=2

set statusline=%<                            " truncate from the beginning
set statusline+=%#ColorColumn#%2n            " buffer number
set statusline+=%*»                          " separator
set statusline+=%#DiffChange#%{getcwd()}/%*  " current working directory
set statusline+=%#DiffAdd#%f%*               " path to the file in the buffer
set statusline+=%#DiffText#%m                " modified flag
set statusline+=%r                           " readonly flag
set statusline+=%*»                          " separator
set statusline+=%#Title#%y                   " filetype
set statusline+=%*»                          " separator
set statusline+=%#CursorLine#(%l/%L,%c)%*»   " line no./no. of lines,col no.
set statusline+=%=«                          " right align the rest
set statusline+=%#Cursor#%02B                " value of current char in hex
set statusline+=%*«                          " separator
set statusline+=%#ErrorMsg#%o                " byte offset
set statusline+=%*«                          " separator
set statusline+=%#ModeMsg#%3p%%              " % through file in lines
set statusline+=%*                           " restore normal highlight

" Fonts ----------------------------------------------- {{{1
if has("gui_running")
  " Envy Code R
  " http://damieng.com/blog/2008/05/26/envy-code-r-preview-7-coding-font-released
  " set guifont=Envy\ Code\ R\ \VS\ 10
  " Monofur
  " http://www.dafont.com/monofur.font
  set guifont=monofur\ 12
endif

" Autocommands ---------------------------------------- {{{1
if has("autocmd")
  " Vala/Genis Support -------------------------------- {{{2
  " get vala.vim here:
  " https://live.gnome.org/Vala/Vim
  augroup vala_support
    au!
    autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
    autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
    autocmd BufRead,BufNewFile *.vala setfiletype vala
    autocmd BufRead,BufNewFile *.vapi setfiletype vala
    autocmd FileType vala setlocal cindent

    " indentation for genie: genie.vim
    " http://www.vim.org/scripts/script.php?script_id=2349
    " This will overrule the default filetype grads
    autocmd BufRead,BufNewFile *.gs setlocal filetype=genie

    autocmd FileType vala,genie setlocal formatoptions+=croql

  " Python Support ------------------------------------ {{{2
  augroup python_support
    au!
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType python inoreab <buffer> #! #!/usr/bin/env python
    autocmd FileType python inoreab <buffer> #e # -*- coding: utf=8 -*-

  " py.test Support ----------------------------------- {{{2
  augroup pytest
    au!
    autocmd FileType python nnoremap <buffer> <silent> <LocalLeader>tf <Esc>:Pytest file looponfail<CR>
    autocmd FileType python nnoremap <buffer> <silent> <LocalLeader>tc <Esc>:Pytest class looponfail<CR>
    autocmd FileType python nnoremap <buffer> <silent> <LocalLeader>tm <Esc>:Pytest method looponfail<CR>

  " Mappings for reStructuredText: Section Headers ---- {{{2
  augroup restructuredtext
    au!
    " Normal Mode: Headings with overline and underline adornments
    autocmd FileType rst nnoremap <buffer> <LocalLeader>h :call MarkReSTSessionTitle(1)<CR>
    " Normal Mode: Sessions with underline adornment
    autocmd FileType rst nnoremap <buffer> <LocalLeader>s :call MarkReSTSessionTitle(0)<CR>
    " Insert Mode: Headings with overline and underline adornments
    autocmd FileType rst inoremap <buffer> <C-]> <C-\><C-O>:call MarkReSTSessionTitle(1)<CR>
    " Insert Mode: Headings with underline adornment
    autocmd FileType rst inoremap <buffer> <C-J> <C-\><C-O>:call MarkReSTSessionTitle(0)<CR>
    " Mapping for plugin DOT
    autocmd FileType rst nnoremap <buffer> <LocalLeader>dot :DotOutlineTree<CR>

  " Tamplate Languages -------------------------------- {{{2
  augroup template_langs
    au!
    " Using something other than {{{,}}} as foldmarker
    autocmd FileType htmldjango,django,jinja,jinja2 setlocal foldmarker=[--,--] commentstring={#\ %s\ #}

  " Default tab settings for different file types ----- {{{2
  augroup tab_settings
    au!
    autocmd FileType asciidoc setlocal sw=2 sts=2
    autocmd FileType c setlocal sw=4 sts=4
    autocmd FileType cpp setlocal sw=4 sts=4
    autocmd FileType css setlocal sw=4 sts=4
    autocmd FileType haskell setlocal sw=4 sts=4 et
    autocmd FileType html setlocal sw=2 sts=2 et
    autocmd FileType htmlcheetah setlocal sw=2 sts=2 et
    autocmd FileType htmldjango setlocal sw=2 sts=2 et
    autocmd FileType java setlocal sw=4 sts=4
    autocmd FileType javascript setlocal sw=4 sts=4
    autocmd FileType jinja setlocal sw=2 sts=2 et
    autocmd FileType jinja2 setlocal sw=2 sts=2 et
    autocmd FileType make set noet
    autocmd FileType mason setlocal sw=2 sts=2
    autocmd FileType ocaml setlocal sw=2 sts=2
    autocmd FileType perl setlocal sw=4 sts=4
    autocmd FileType php setlocal sw=4 sts=4
    autocmd FileType rst setlocal sw=2 sts=2 et
    autocmd FileType ruby setlocal sw=2 sts=2
    autocmd FileType python setlocal sw=4 sts=4 et tw=72
    autocmd FileType scheme setlocal sw=2 sts=2 et
    autocmd FileType sql setlocal et
    autocmd FileType vala setlocal sw=4 sts=4
    autocmd FileType xhtml setlocal sw=2 sts=2 et
    autocmd FileType xml setlocal sw=2 sts=2 et
    autocmd FileType text setlocal textwidth=78

  " Leave insert mode after 15 seconds of no input ---- {{{2
  augroup auto_escape
    au!
    " nice trick by winzo
    " http://www.reddit.com/r/vim/comments/kz84u/what_are_some_simple_yet_mindblowing_tweaks_to/c2ol6wd
    "autocmd CursorHoldI * stopinsert
    "autocmd InsertEnter * let updaterestore=&updatetime | set updatetime=15000
    "autocmd InsertLeave * let &updatetime=updaterestore

  " Show trailing whitespaces when necessary ---------- {{{2
  " That is, most of the cases other than editing source code in Whitespace,
  " the programming language.
  augroup show_whitespaces
    au!
    " Make sure this will not be cleared by colorscheme
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()

  " Misc ---------------------------------------------- {{{2
  augroup editing
    au!
    " Toggling between number and relativenumber when entering/leaving insert mode
    autocmd InsertEnter * set number
    autocmd InsertLeave * set relativenumber
    " remove trailing whitespaces
    autocmd BufWritePre * call StripTrailingWhitespace()

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

    " turn on spell checker for email
    autocmd FileType mail setlocal spell

  augroup END " --------------------------------------- }}}2
else
  set autoindent
endif " has("autocmd")

" Colorschemes ---------------------------------------- {{{1
" get them from: http://www.vim.org/
" also: http://code.google.com/p/vimcolorschemetest/ (recommanded)
"
" ColorScheme Table ----------------------------------- {{{2
" Name          | Background | C/C++ | HTML | CSS | Javascript | Django | Haskell | Lisp | Python
" badwolf       | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" bocau         | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" candycode     | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" clarity       | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" cloudy        | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" fruity        | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" hemisu        | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" inkpot        | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" ir_black      | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✗       | ✓    | ✓
" jellybeans    | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✗       | ✓    | ✓
" kib_darktango | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" koehler       | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" mint          | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✗       | ✓    | ✓
" molokai       | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" murphy        | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" native        | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" navajo-night  | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" neverness     | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" northsky      | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" oceanblack    | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" peppers       | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" redblack      | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✗       | ✓    | ✓
" relaxedgreen  | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" sift          | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" slate         | dark       | ✓     | ✓    | ✓   | ✓          | ✗      | ✓       | ✓    | ✓
" pablo         | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" twilight      | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✗       | ✓    | ✓
" vj            | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" vividchalk    | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" wintersday    | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" wombat        | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" solarized     | light/dark | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" kib_plastic   | light      | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓

" hemisu:
" only works in gVim
"
" ir_black:
" http://blog.infinitered.com/entries/show/8
" http://blog.infinitered.com/entry_files/8/ir_black.vim
"
" solarized:
" http://ethanschoonover.com/solarized
"
" badwolf:
" http://stevelosh.com/projects/badwolf/
" hg clone ssh://hg@bitbucket.org/sjl/badwolf
"
" }}}2

if has("gui_running")
  set background=dark
  colorscheme badwolf
else
  set background=dark
  colorscheme bocau
endif

" Plugins --------------------------------------------- {{{1
" ack.vim, Ack front-end for vim ---------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2572
" https://github.com/mileszs/ack.vim

" Conque ---------------------------------------------- {{{2
" http://code.google.com/p/conque/
" interactive shell in vim buffer
" Bash
nnoremap <Leader>sh :ConqueTermSplit bash<CR>
" Python Shell
nnoremap <Leader>py :ConqueTermSplit python<CR>
" gdb
nnoremap <Leader>gdb :ConqueTermSplit gdb<CR>

" Ctrl-P ---------------------------------------------- {{{2
" http://kien.github.com/ctrlp.vim/
" git://github.com/kien/ctrlp.vim.git
" https://bitbucket.org/kien/ctrlp.vim
" Mappings:
" let g:ctrlp_map = '<C-P>'
" Search from project root:
" let g:ctrlp_working_path_mode = 2
" Exclude VCS cache dir, either:
" set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   " for Linux/MacOSX
" or:
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.pyc$\|\.so$\|\.o$',
  \ }
" Match window, top of the screen:
" let g:ctrlp_match_window_bottom = 0

" Cute Python ----------------------------------------- {{{2
" https://github.com/ehamberg/vim-cute-python

" dot.vim ------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=1225

" FuzzyFinder ----------------------------------------- {{{2
" vim-l9 is the requirement of fuzzyfinder 4.*
" http://www.vim.org/scripts/script.php?script_id=3252
" http://bitbucket.org/ns9tks/vim-l9/
"set runtimepath+=~/projects/vim-l9/
" http://www.vim.org/scripts/script.php?script_id=1984
" http://bitbucket.org/ns9tks/vim-fuzzyfinder/
" mapping for FuzzyFinder
" use V 3.4
"set runtimepath+=~/projects/vim-fuzzyfinder/
"nnoremap <Leader>ff :FufFile ~/projects/<CR>
" search from cwd
nnoremap <Leader>ff :FufFile<CR>
nnoremap <Leader>fb :FufBuffer<CR>

" Gundo ----------------------------------------------- {{{2
" http://sjl.bitbucket.org/gundo.vim/
" hg clone ssh://hg@bitbucket.org/sjl/gundo.vim
nnoremap <Leader>u :GundoToggle<CR>

" Haskell Conceal ------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=3200
" https://github.com/Twinside/vim-haskellConceal

" Indent Guides --------------------------------------- {{{2
" https://github.com/nathanaelkane/vim-indent-guides

" NERDTree -------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=1658
" https://github.com/scrooloose/nerdtree
nnoremap <Leader>nt :NERDTreeToggle<CR>

" Pathogen -------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2332
" https://github.com/tpope/vim-pathogen

" py.test --------------------------------------------- {{{2
" https://github.com/alfredodeza/pytest.vim.git

" Rainbow Parentheses --------------------------------- {{{2
" https://github.com/kien/rainbow_parentheses.vim

" Slimv ----------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2531
" https://bitbucket.org/kovisoft/slimv/
let g:slimv_swank_cmd = '! gnome-terminal -e "sbcl --load ' . $HOME . '/.vim/bundle/slimv/slime/start-swank.lisp" &'

" snipMate -------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2540
" http://github.com/msanders/snipmate.vim
" https://github.com/garbas/vim-snipmate

" Sparkup --------------------------------------------- {{{2
" You can write HTML in a CSS-like syntax, and have Sparkup handle the
" expansion to full HTML code.
" http://github.com/rstacruz/sparkup
" try this:
" ihtml:xxs>#wrapper>#nav>h2{navigation}+ul>li#id_$*3>a<<<#main{Page Content}+div#footer{Footer}<c-tab>
let g:sparkupExecuteMapping = '<C-]>'
let g:sparkupNextMapping = '<C-J>'

" SuperTab -------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=1643

" Surround -------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=1697
" git://github.com/tpope/vim-surround.git

" Tabular --------------------------------------------- {{{2
" https://github.com/godlygeek/tabular

" Tagbar ---------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=3465
" http://github.com/majutsushi/tagbar
nnoremap <Leader>tb :TagbarToggle<CR>

" Taglist --------------------------------------------- {{{2
" http://vim-taglist.sourceforge.net/
"nnoremap <Leader>tl :TlistToggle<CR>
"nnoremap <Leader>gt :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" add python tags
" ctags file is generated like this:
" ctags -R -f ~/.vim/tags/python.ctags --c-kinds=+p --fields=+S /usr/lib/python2.6/
"set tags+=$HOME/.vim/tags/python.ctags
" for C/C++ with signature
" ctags -R -f ~/.vim/tags/c.ctags --c-kinds=+p --fields=+S /usr/include/
" ctags -R -f ~/.vim/tags/cpp.ctags --c++-kinds=+p --fields=+iaS --extra=+q /usr/include
"set tags+=$HOME/.vim/tags/cpp.ctags

" TaskList -------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2607

" UltiSnips ------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2715
" official mirror: https://github.com/sirver/ultisnips
" TextMate style:
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" local snippets only:
"let g:UltiSnipsSnippetDirectories = ["snippets"]
" Snippets dir
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "snippets"]
" vsplit the snippets edit window
let g:UltiSnipsEditSplit = 'vertical'

" Vim CSS Color --------------------------------------- {{{2
" https://github.com/skammer/vim-css-color
" let g:cssColorVimDoNotMessMyUpdatetime = 1

" VimIm ----------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2506
" vimim settings, show menu background color
"let g:vimim_wildcard_search=1
"let g:vimim_sexy_onekey=1
"let g:vimim_chinese_frequency=10
"let g:vimim_custom_color=0
"let g:vimim_mode = 'static'
"let g:vimim_map= 'no-gi'

" xpt, XP Templates ----------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2611
" http://code.google.com/p/xptemplate

" use <Tab> key as trigger
" let g:xptemplate_key = '<Tab>'
" no spaces inside ()
" let g:xptemplate_vars = "SParg="

" not going to set it now.
" let g:xptemplate_vars = "author=somebody&email=nobody@gmail.com"

" set runtimepath+=~/projects/xpt
" set runtimepath+=~/projects/xpt/after

" ZenCoding.vim --------------------------------------- {{{2
" vim plugins for HTML and CSS hi-speed coding.
" http://www.vim.org/scripts/script.php?script_id=2981
" http://mattn.github.com/zencoding-vim/
" This one has more features, I am not using this one right now.
" It doesn't honor my sw, sts settings.

" Commands, Mappings and Functions -------------------- {{{1
" <Space> in Normal mode ------------------------------ {{{2
" Center current line
"nnoremap <Space> zz
" Center current line and reset highlighting for search
nnoremap <Space> zz:nohlsearch<CR>
" Next empty Line
"nnoremap <Space> }
" Insert one character
"nnoremap <Space> i_<ESC>r
" Quick command mode
"nnoremap <Space> :
" Toggle fold
"nnoremap <Space> za
"
" cd here --------------------------------------------- {{{2
" Change into directory of the current file
cnoreab cdh cd %:p:h
cnoreab cd. cd %:p:h
cnoreab lcdh lcd %:p:h
cnoreab lcd. lcd %:p:h

" Code Folding ---------------------------------------- {{{2
" I love markers
set fdm=marker

" DiffOrig -------------------------------------------- {{{2
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" MarkReSTSessionTitle -------------------------------- {{{2
function! MarkReSTSessionTitle(overline)
  " From reStructuredText Markuo Specification
  " The following are all valid section title adornment characters:
  " ! " # $ % & ' ( ) * + , - . / : ; < = > ? @ [ \ ] ^ _ ` { | } ~
  " let l:rest_valid_session_marks = "!#$%&'()*+,-./:;<=>?@[\]^_`{|}~" . '"'
  " Some characters are more suitable than others.
  " The following are recommended:
  " = - ` : . ' " ~ ^ _ * + #
  if !exists("g:rest_session_marks")
    let g:rest_session_marks = "#*=-^" . '"' . "'`;:.~_+"
  endif

  echo "Enter any of these【" . g:rest_session_marks . "】: "
  let l:mark = nr2char(getchar())
  if stridx(g:rest_session_marks, l:mark) != -1
    let l:linewidth = strwidth(getline('.'))
    let l:adornment = repeat(l:mark, l:linewidth)
    let l:curline = line('.')
    " no test, fail silently
    let l:failed = append(l:curline, l:adornment)
    if a:overline
      let l:failed = append(l:curline-1, l:adornment)
    endif
    normal j
    normal $
  endif
endfunction

" More vala/genie support ----------------------------- {{{2
" Vala settings as described here:
" https://live.gnome.org/Vala/Vim

" Disable valadoc syntax highlight
"let vala_ignore_valadoc = 1

" Enable comment strings
let vala_comment_strings = 1

" Highlight space errors
let vala_space_errors = 1
" Disable trailing space errors
"let vala_no_trail_space_error = 1
" Disable space-tab-space errors
let vala_no_tab_space_error = 1

" Minimum lines used for comment syncing (default 50)
"let vala_minlines = 120

" Popup Menu in IDE style ----------------------------- {{{2
" From
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
"set completeopt=longest,menuone
"set completeopt=longest
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" StripTrailingWhitespace ----------------------------- {{{2
function! StripTrailingWhitespace()
  " To disable this function, either set ft as keep_whitespace prior saving
  " or define a buffer local variable named keepWhitespace
  if &ft =~ 'whitespace\|keep_whitespace' || exists('b:keep_whitespace')
    return
  endif
  let l:savedview = winsaveview()
  silent! %s/\s*$//e
  call winrestview(l:savedview)
endfunction
