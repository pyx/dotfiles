" -*- vim: set sts=2 sw=2 et fdm=marker: -------------  vim modeline -*-
" [Pathogen] ------------------------------------------ {{{1
call pathogen#infect()

" Basic Settings -------------------------------------- {{{1
" use a POSIX shell, need this as fish is default shell now
set shell=/bin/bash

syntax on
set nocompatible
filetype plugin indent on

set hidden
set hlsearch
set incsearch
set matchtime=2
set ruler
set showcmd
set showmatch
set title
set wildmenu
set wildmode=list:longest,list:full
" ignore files inside vcs dirs
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
" ignore object code files
set wildignore+=*.o,*.obj,*.a,*.so
" ignore python cache files
set wildignore+=*.pyc,*.pyo,*/__pycache__

set backup
set backupdir=~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.tmp//,~/tmp//,/var/tmp//,/tmp//

set backspace=indent,eol,start
set history=200

set fileencodings=ucs-bom,utf8,cp936,gbk,big5,euc-jp,euc-kr,gb18030,latin1

set dictionary+=/usr/share/dict/words

" use faster grep cmd if available
if executable('ag')
  set grepprg=ag\ --nocolor\ --nogroup
endif

" tabs and spaces
set listchars+=tab:▸\ ,trail:⋅,nbsp:⋅
" eols and others
set listchars+=eol:¬,extends:»,precedes:«

" highlight columns after 'textwidth'
set colorcolumn=+1,+2,+4,+5,+6,+7,+8

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
  " no scroll bars
  set guioptions-=r
  set guioptions-=L
endif

" Status Line ----------------------------------------- {{{1
set laststatus=2

set statusline=%#ColorColumn#%2n              " buffer number
set statusline+=%*»                           " separator
set statusline+=%<                            " truncate here
set statusline+=%#DiffChange#%{PWDName()}%*   " current working directory
set statusline+=%#DiffAdd#%f%*                " path to the file in the buffer
set statusline+=%#DiffOrig#%{CurrentTag()}%*  " current tag
set statusline+=%*»                           " separator
set statusline+=%#Title#%{ReposType()}%*      " current repository type
set statusline+=%*»                           " separator
set statusline+=%#ModeMsg#%{RevisionInfo()}%* " current revision info
set statusline+=%#DiffText#%m                 " modified flag
set statusline+=%r                            " readonly flag
set statusline+=%*»                           " separator
set statusline+=%#CursorLine#(%l/%L,%c)%*»    " line no./no. of lines,col no.
set statusline+=%=«                           " right align the rest
set statusline+=%#Cursor#%02B                 " value of current char in hex
set statusline+=%*«                           " separator
set statusline+=%#ErrorMsg#%o                 " byte offset
set statusline+=%*«                           " separator
set statusline+=%#Title#%y                    " filetype
set statusline+=%*«                           " separator
set statusline+=%#ModeMsg#%3p%%               " % through file in lines
set statusline+=%*                            " restore normal highlight

" Plugins --------------------------------------------- {{{1
" Abolish --------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=1545
" https://github.com/tpope/vim-abolish/
" git clone git://github.com/tpope/vim-abolish.git

" Calendar -------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=52
" https://github.com/mattn/calendar-vim/
" git clone git://github.com/mattn/calendar-vim

" Commentary ------------------------------------------ {{{2
" http://www.vim.org/scripts/script.php?script_id=3695
" https://github.com/tpope/vim-commentary/
" git clone git://github.com/tpope/vim-commentary.git

" Ctrl-P ---------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=3736
" http://kien.github.com/ctrlp.vim/
" https://bitbucket.org/kien/ctrlp.vim/
" git clone git://github.com/kien/ctrlp.vim.git
"
" Mappings:
" let g:ctrlp_map = '<C-P>'
" Search from project root:
" let g:ctrlp_working_path_mode = 2
" Match window, top of the screen:
" let g:ctrlp_match_window_bottom = 0
" switching between buffers
nnoremap <leader><Tab> :CtrlPBuffer<CR>
" line mode
nnoremap <leader>l :CtrlPLine<CR>
" mixed mode
nnoremap <leader>m :CtrlPMixed<CR>
" quickfix mode
nnoremap <leader>q :CtrlPQuickfix<CR>
" goto tags
nnoremap <leader>t :CtrlPTag<CR>

" Gundo ----------------------------------------------- {{{2
" http://sjl.bitbucket.org/gundo.vim/
" hg clone https://bitbucket.org/sjl/gundo.vim
nnoremap <leader>u :GundoToggle<CR>

" Haskell Mode ---------------------------------------- {{{2
" http://projects.haskell.org/haskellmode-vim/
" installed from gentoo haskell overlay
let g:haddock_browser = '/usr/bin/firefox-bin'

" Indent Python --------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=974
" https://github.com/vim-scripts/indentpython.vim/
" git clone git://github.com/vim-scripts/indentpython.vim.git

" matchit.vim ----------------------------------------- {{{2
" enable matchit.vim
runtime macros/matchit.vim

" Netrw ----------------------------------------------- {{{2
" comes with vim
" Tree style
let g:netrw_liststyle = 3

" Paredit --------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=3998
" https://bitbucket.org/kovisoft/paredit
" hg clone https://bitbucket.org/pyx/paredit

" Pathogen -------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2332
" https://github.com/tpope/vim-pathogen/
" git clone git://github.com/tpope/vim-pathogen.git

" py.test --------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=3424
" https://github.com/alfredodeza/pytest.vim/
" git clone git://github.com/alfredodeza/pytest.vim.git

" Rainbow Parentheses Improved ------------------------ {{{2
" https://github.com/luochen1990/rainbow
" git clone git://github.com/luochen1990/rainbow.git
let g:rainbow_active = 0

" Repeat ---------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2136
" https://github.com/tpope/vim-repeat/
" git clone git://github.com/tpope/vim-repeat.git

" Slime ----------------------------------------------- {{{2
" https://github.com/jpalardy/vim-slime
" git clone git://github.com/jpalardy/vim-slime.git
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()

" Slimv ----------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2531
" https://bitbucket.org/kovisoft/slimv/
" #hg clone https://bitbucket.org/kovisoft/slimv
" let g:slimv_swank_cmd = '! urxvt -e sbcl --load ' . $HOME . '/.vim/bundle/slimv/slime/start-swank.lisp &'
" Join all closing parenthesis when appropriate
" let g:paredit_electric_return = 1

" Speeddating ----------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2120
" https://github.com/tpope/vim-speeddating/
" git clone git://github.com/tpope/vim-speeddating.git

" Surround -------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=1697
" https://github.com/tpope/vim-surround/
" git clone git://github.com/tpope/vim-surround.git

" Tabular --------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=3464
" https://github.com/godlygeek/tabular/
" git clone git://github.com/godlygeek/tabular.git

" Tagbar ---------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=3465
" http://github.com/majutsushi/tagbar/
" git clone git://github.com/majutsushi/tagbar.git
nnoremap <leader>tb :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1

let g:tagbar_type_vala = {
  \ 'ctagstype': 'c#',
  \ 'kinds': [
    \ 'c:class',
    \ 'd:macro',
    \ 'E:event',
    \ 'g:enum',
    \ 'i:interface',
    \ 'm:method',
    \ 'n:namespace',
    \ 'p:properties',
    \ 's:struct',
  \ ]
\ }

let g:tagbar_type_hy = {
  \ 'ctagstype': 'hy',
  \ 'kinds': [
    \ 'a:anonymous function',
    \ 'c:class',
    \ 'd:definition',
    \ 'f:function',
    \ 'i:imports',
    \ 'm:macro',
    \ 'r:reader macro',
  \ ]
\ }

" TaskList -------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2607
" https://github.com/vim-scripts/TaskList.vim
" git clone https://github.com/vim-scripts/TaskList.vim
nmap <unique> <leader>tl <Plug>TaskList

" TimL ------------------------------------------------ {{{2
" tpope is the man
" https://github.com/tpope/timl
" git clone https://github.com/tpope/timl.git

" Vim CSS Color --------------------------------------- {{{2
" https://github.com/skammer/vim-css-color/
" #git clone git://github.com/skammer/vim-css-color.git
"
" ap's clone, this one has way shorter startup time.
" https://github.com/ap/vim-css-color/
" git clone git://github.com/ap/vim-css-color.git
"
" let g:cssColorVimDoNotMessMyUpdatetime = 1

" Vim Hy ---------------------------------------------- {{{2
" Hy language official support
" https://github.com/hylang/vim-hy
" git clone https://github.com/hylang/vim-hy.git

" Vim Table Mode -------------------------------------- {{{2
" Dependency: Tabular
" https://github.com/dhruvasagar/vim-table-mode/
" git clone git://github.com/dhruvasagar/vim-table-mode.git
let g:table_mode_map_prefix = '<Leader>-'
let g:table_mode_tableize_op_map = '<Leader>-T'

" vim-indent-object ----------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=3037
" https://github.com/michaeljsmith/vim-indent-object/
" git clone git://github.com/michaeljsmith/vim-indent-object.git

" VimIm ----------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2506
" http://code.google.com/p/vimim/
" https://github.com/vimim/vimim/
" #svn checkout https://vimim.googlecode.com/svn/trunk/ vimim
" git clone git://github.com/vimim/vimim.git
"
" vimim settings, show menu background color
let g:vimim_cloud = -1
let g:vimim_map = 'no-gi'
"let g:vimim_mode = 'static'
"let g:vimim_mycloud = 0
let g:vimim_toggle = 'pinyin'

" vimwiki --------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2226
" http://code.google.com/p/vimwiki/
" https://github.com/vimwiki/vimwiki
" #hg clone https://code.google.com/p/vimwiki/
" git clone git://github.com/vimwiki/vimwiki.git
let g:vimwiki_folding = 'expr'
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_hl_headers = 1

" Fonts ----------------------------------------------- {{{1
if has("gui_running")
  " Envy Code R
  " http://damieng.com/blog/2008/05/26/envy-code-r-preview-7-coding-font-released
  " set guifont=Envy\ Code\ R\ \VS\ 10
  "
  " Monofur
  " http://www.dafont.com/monofur.font
  set guifont=monofur\ 12
  "
  " Cosmic Sans Neue
  " https://github.com/belluzj/cosmic-sans-neue
  " set guifont=Cosmic\ Sans\ Neue\ Mono\ 12
  "
  " Fantasque Sans Mono
  " http://openfontlibrary.org/en/font/fantasque-sans-mono
  ""https://github.com/belluzj/fantasque-sans
  "
  " Hermit
  ""https://pcaro.es/p/hermit/
  " https://github.com/pcaro90/hermit
  "
  " Source Code Pro
  " http://blogs.adobe.com/typblography/2012/09/source-code-pro.html
  " http://sourceforge.net/projects/sourcecodepro.adobe/
  " https://github.com/adobe/Source-Code-Pro
  " set guifont=Source\ Code\ Pro\ 12
  "
  " Ubuntu Mono
  " http://font.ubuntu.com/
  " set guifont=Ubuntu\ Mono\ 12
endif

" Colorschemes ---------------------------------------- {{{1
" get them from: http://www.vim.org/
" also: http://code.google.com/p/vimcolorschemetest/ (recommanded)
"
" ColorScheme Table ----------------------------------- {{{2
" Name           | Background | C/C++ | HTML | CSS | Javascript | Django | Haskell | Lisp | Python
" badwolf        | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" blackboard     | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" bocau          | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" candycode      | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" clarity        | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" cloudy         | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" darkburn       | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✗       | ✓    | ✓
" fruity         | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" fu             | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" gummybears     | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" gruvbox        | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" harlequin      | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" herald         | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" hemisu         | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" hybrid         | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" inkpot         | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" ir_black       | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✗       | ✓    | ✓
" jellybeans     | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✗       | ✓    | ✓
" jellyx         | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" kolor          | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" liquidcarbon   | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" molokai        | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" native         | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" navajo-night   | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" neverness      | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" oceanblack     | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" peaksea        | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" redblack       | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" slate          | dark       | ✓     | ✓    | ✓   | ✓          | ✗      | ✓       | ✓    | ✓
" twilight       | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" Tomorrow-N     | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✗    | ✓
" Tomorrow-N-BL  | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✗    | ✓
" Tomorrow-N-BR  | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✗    | ✓
" Tomorrow-N-E   | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✗    | ✓
" vj             | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" wombat         | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" xoria256       | dark       | ✓     | ✓    | ✓   | ✓          | ✗      | ✓       | ✓    | ✓
" zenburn        | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✗       | ✓    | ✓
" solarized      | light/dark | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" blueshift      | light      | ✓     | ✓    | ✓   | ✓          | ✓      | ✗       | ✓    | ✓
" mayansmoke     | light      | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" proton         | light      | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" pyte           | light      | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" summerfruit256 | light      | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓

" base16:
" https://github.com/chriskempson/base16-vim
" git clone git://github.com/chriskempson/base16-vim.git
"
" hemisu:
" only works in gVim
"
" ir_black:
" http://blog.toddwerth.com/entries/8
" http://blog.toddwerth.com/entry_files/8/ir_black.vim
"
" preto
" https://github.com/ewilazarus/preto
" git clone git://github.com/ewilazarus/preto.git
"
" tomorrow:
" https://github.com/chriskempson/vim-tomorrow-theme/
" git clone git://github.com/chriskempson/vim-tomorrow-theme.git
" Tomorrow-N is Tomorrow-Night
" Tomorrow-N-BL is Tomorrow-Night-Blue
" Tomorrow-N-BR is Tomorrow-Night-Bright
" Tomorrow-N-E is Tomorrow-Night-Eighties
" }}}2

if has("gui_running")
  set background=dark
  colorscheme badwolf
else
  set t_Co=256
  set background=dark
  colorscheme bocau
endif

" Autocommands ---------------------------------------- {{{1
if has("autocmd")
  " Show trailing whitespaces when necessary ---------- {{{2
  " That is, most of the cases other than editing source code in Whitespace,
  " the programming language.
  augroup show_whitespaces
    au!
    " Make sure this will not be cleared by colorscheme
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    " Highlight unwanted whitespaces
    autocmd BufWinEnter,WinEnter,InsertLeave * call MatchUnwantedWhitespaces()
    " In insert mode, show trailing whitespaces except when typing at the end
    " of a line
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    " Show whitespaces in insert mode
    autocmd InsertEnter * set list
    " and turn it off when leave insert mode
    autocmd InsertLeave * set nolist
    " Clear highlight when lose focus
    autocmd WinLeave * call clearmatches()

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
    " Setting 'python_space_error_highlight' = 1 will only highlight mixed
    " tabs and spaces, I go as far as mark all tabs as error.
    autocmd Syntax python syn match ExtraWhitespace /\t/

  " Haskell Support ----------------------------------- {{{2
  augroup haskell_support
    au!
    " set compiler, then restore 'cmdheight' back to 1
    autocmd BufEnter *.hs,*.lhs compiler ghc | set cmdheight=1
    " changed maplocalleader when editing haskell.
    " due to implementation details of vim-haskellmode, it is too later if we
    " set maplocalleader with 'autocmd FileType haskell', so ':setf haskell'
    " in a newly created unnamed buffer will not get vim-haskellmode hotkeys
    " set properly.
    " to avoid this, either hack vim-haskellmode's code or set maplocalleader
    " globally.
    autocmd BufReadPre,BufNew,BufNewFile *.hs,*.lhs :let maplocalleader=","

  " Hy Support ---------------------------------------- {{{2
  augroup hy_support
    au!
    " recognize lisp comments
    autocmd FileType hy setlocal comments=n:;

  " Mappings for reStructuredText: Section Headers ---- {{{2
  augroup restructuredtext
    au!
    " Normal Mode: Headings with overline and underline adornments
    autocmd FileType rst nnoremap <buffer> <localleader>h :call MarkReSTSessionTitle(1)<CR>
    " Normal Mode: Sessions with underline adornment
    autocmd FileType rst nnoremap <buffer> <localleader>s :call MarkReSTSessionTitle(0)<CR>
    " Insert Mode: Headings with overline and underline adornments
    autocmd FileType rst inoremap <buffer> <C-]> <C-\><C-O>:call MarkReSTSessionTitle(1)<CR>
    " Insert Mode: Headings with underline adornment
    autocmd FileType rst inoremap <buffer> <C-J> <C-\><C-O>:call MarkReSTSessionTitle(0)<CR>
    " Mapping for plugin DOT
    autocmd FileType rst nnoremap <buffer> <localleader>dot :DotOutlineTree<CR>

  " Tamplate Languages -------------------------------- {{{2
  augroup template_langs
    au!
    " Using something other than {{{,}}} as foldmarker
    autocmd FileType htmldjango,django,jinja,jinja2 setlocal foldmarker=[--,--] commentstring={#\ %s\ #}

  " Default whitespace settings ----------------------- {{{2
  augroup whitespace_settings
    au!
    " Indentation with hard tabs:
    " set 'shiftwidth' and 'tabstop' to the same amount, usually less than 8
    " for better viewing, leaving 'softtabstop' unset and 'expandtab' at
    " default value
    autocmd FileType go setlocal sw=4 ts=4
    autocmd FileType java setlocal sw=4 ts=4
    autocmd FileType php setlocal sw=4 ts=4
    " Indentation with spaces:
    " set 'shiftwidth' and 'softtabstop' to the same amount, usually turn on
    " 'expandtab' to avoid mixing spaces and tabs, leaving 'tabstop' at
    " default value.
    autocmd FileType asciidoc setlocal sw=2 sts=2 et
    autocmd FileType c setlocal sw=4 sts=4 et tw=78
    autocmd FileType coffee setlocal sw=2 sts=2 et tw=78
    autocmd FileType cpp setlocal sw=4 sts=4 et tw=78
    autocmd FileType css setlocal sw=4 sts=4 et
    autocmd FileType erlang setlocal sw=4 sts=4 et
    autocmd FileType haskell setlocal sw=4 sts=4 et
    autocmd FileType html setlocal sw=2 sts=2 et
    autocmd FileType htmlcheetah setlocal sw=2 sts=2 et
    autocmd FileType htmldjango setlocal sw=2 sts=2 et
    autocmd FileType hy setlocal sw=2 sts=2 et tw=78
    autocmd FileType javascript setlocal sw=2 sts=2 et
    autocmd FileType jinja setlocal sw=2 sts=2 et
    autocmd FileType jinja2 setlocal sw=2 sts=2 et
    autocmd FileType lisp setlocal sw=2 sts=2 et
    autocmd FileType lua setlocal sw=2 sts=2 et
    autocmd FileType markdown setlocal sw=4 sts=4 et
    autocmd FileType mason setlocal sw=2 sts=2 et
    autocmd FileType ocaml setlocal sw=2 sts=2 et tw=78
    autocmd FileType perl setlocal sw=4 sts=4 et
    autocmd FileType python setlocal sw=4 sts=4 et tw=78
    autocmd FileType rst setlocal sw=2 sts=2 et
    autocmd FileType ruby setlocal sw=2 sts=2 et
    autocmd FileType rust setlocal sw=4 sts=4 et
    autocmd FileType scheme setlocal sw=2 sts=2 et
    autocmd FileType vala setlocal sw=4 sts=4 et tw=78
    autocmd FileType xhtml setlocal sw=2 sts=2 et
    autocmd FileType xml setlocal sw=2 sts=2 et
    autocmd FileType yaml setlocal sw=2 sts=2 et
    " Others with special requirements
    autocmd FileType make setlocal noet
    autocmd FileType sql setlocal et
    autocmd FileType gitcommit setlocal textwidth=72
    autocmd FileType hgcommit setlocal textwidth=72
    autocmd FileType text setlocal textwidth=72
    autocmd FileType vimwiki setlocal sw=2 sts=2 et

  " Language specific indentation --------------------- {{{2
  augroup switch_case_indentation
    au!
    " cino-:
    " line up case labels with switch:
    "     switch (a) {
    "     case 1:
    "         /* ... */
    "         break;
    "     default:
    "         break;
    "     }
    autocmd FileType c,cpp,vala setlocal cinoptions+=:0

  augroup case_block_indentation
    au!
    " cino-l
    " align with case label:
    "     switch (a) {
    "     case 1: {
    "         /* ... */
    "         break;
    "     }
    "     default:
    "         break;
    "     }
    autocmd FileType c,cpp,vala setlocal cinoptions+=l1

  augroup access_specifier_indentation
    au!
    " cino-g
    " no indentation for access specifiers
    "     class C {
    "     public:
    "         // ...
    "     protected:
    "         // ...
    "     private:
    "         // ...
    "     };
    autocmd FileType cpp setlocal cinoptions+=g0

  augroup lambda_function_indentation
    au!
    " cino-j
    " indent anonymous functions correctly
    "     foo.some_event.connect((a, b) => {
    "         stdout.printf(a, b);
    "     });
    autocmd FileType vala setlocal cinoptions+=j1

  augroup namespace_indentation
    au!
    " cino-N
    " no indentation for namespace
    "     namespace {
    "     void function();
    "     }
    autocmd FileType cpp,vala setlocal cinoptions+=N-s

  augroup unclosed_parentheses_indentation
    au!
    " cino-(
    " line up inside unclosed parentheses
    "     if (c1 && (c2 ||
    "                c3))
    "         ;
    "     if (c1 &&
    "         (c2 || c3))
    "         ;
    autocmd FileType c,cpp,vala setlocal cinoptions+=(0

  augroup return_type_indentation
    au!
    " cino-t
    " no indentation for return type declarations
    "     int
    "     func()
    autocmd FileType c,cpp,vala setlocal cinoptions+=t0

  " Update repository and revision info --------------- {{{2
  augroup update_rev_info
    au!
    autocmd BufReadPost,BufWritePost,FileChangedShellPost * call UpdateRevisionInfo()

  " Leave insert mode after 15 seconds of no input ---- {{{2
  augroup auto_escape
    au!
    " nice trick by winzo
    " http://www.reddit.com/r/vim/comments/kz84u/what_are_some_simple_yet_mindblowing_tweaks_to/c2ol6wd
    "autocmd CursorHoldI * stopinsert
    "autocmd InsertEnter * let updaterestore=&updatetime | set updatetime=15000
    "autocmd InsertLeave * let &updatetime=updaterestore

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

    " turn on spell checker for commit messages
    autocmd FileType gitcommit,hgcommit setlocal spell
    " and emails, makrdown, reStructuredText and plain text files
    autocmd FileType mail,markdown,rst,text setlocal spell
    " except 'help' files
    autocmd BufEnter *.txt if &filetype == 'help' | setlocal nospell | endif

    " close preview winodw when completion done
    autocmd CompleteDone * pclose

  augroup END " --------------------------------------- }}}2
else
  set autoindent
endif " has("autocmd")

" Commands, Mappings and Functions -------------------- {{{1
" <Space> in Normal mode ------------------------------ {{{2
" Center current line
"nnoremap <Space> zz
" Center current line, reset number and highlighting for search
" nnoremap <Space> zz:set number<CR>:nohlsearch<CR>
" Next empty Line
"nnoremap <Space> }
" Insert one character
"nnoremap <Space> i_<Esc>r
" Quick command mode
"nnoremap <Space> :
" Quick command mode with no highlight
nnoremap <Space> :nohlsearch<CR>:
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

" CurrentTag ------------------------------------------ {{{2
function! CurrentTag()
  if exists('b:show_tag_in_statusline') && b:show_tag_in_statusline == 1
    return tagbar#currenttag('[%s]','','f')
  else
    return ''
  endif
endfunction

" DiffOrig -------------------------------------------- {{{2
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Haskell syntax options ------------------------------ {{{2
" Specific options handled by haskell.vim

let hs_highlight_delimiters = 1
let hs_highlight_boolean = 1
let hs_highlight_types = 1
let hs_highlight_more_types = 1
let hs_highlight_debug = 1

" HTML indentation options ---------------------------- {{{2
let g:html_indent_inctags = "html,body,head,tbody"

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
    normal! j
    normal! $
  endif
endfunction

" MatchUnwantedWhitespaces ---------------------------- {{{2
function! MatchUnwantedWhitespaces()
  if &filetype == 'help'
    call clearmatches()
    return
  endif
  highlight ExtraWhitespace ctermbg=red guibg=red
  " Show all trailing whitespaces: /\s\+$/
  " and spaces followed by tabs:   / \+\t\+\s*/
  " and tabs followed by spaces:   /\t\+ \+\s*/
  " combine them together: /\s\+$\| \+\t\+\s*\|\t\+ \+\s*/
  match ExtraWhitespace /\s\+$\| \+\t\+\s*\|\t\+ \+\s*/
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

" OCaml support --------------------------------------- {{{2
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
execute "set rtp^=" . g:opamshare . "/ocp-indent/vim"

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

" PWDName --------------------------------------------- {{{2
function! PWDName()
  let l:pwd_name = fnamemodify(getcwd(), ':~:.')
  if l:pwd_name != ""
    let l:pwd_name .= '/'
  endif
  return l:pwd_name
endfunction

" ReposType ------------------------------------------- {{{2
" Return repository type if current file is inside one
function! ReposType()
  if !exists('b:repos_type')
    return ''
  endif
  return b:repos_type
endfunction

" RevisionInfo ---------------------------------------- {{{2
" Return revision info of current file
function! RevisionInfo()
  if !exists('b:revision_info')
    return ''
  endif
  return b:revision_info
endfunction

" StripTrailingWhitespace ----------------------------- {{{2
function! StripTrailingWhitespace()
  " To disable this function, either set ft as keep_whitespace prior saving
  " or define a buffer local variable named keep_whitespace
  if &ft =~ 'vim\|whitespace\|keep_whitespace' || exists('b:keep_whitespace')
    return
  endif
  let l:savedview = winsaveview()
  keepjumps silent! %s/\s\+$//e
  call winrestview(l:savedview)
endfunction

" tags ------------------------------------------------ {{{2
set tags+=.tags;
set tags+=tags;
nnoremap <leader>gt :!ctags -R -f .tags<CR>

" ToggleCurrentTag ------------------------------------ {{{2
function! ToggleCurrentTag()
  if exists('b:show_tag_in_statusline')
    let b:show_tag_in_statusline = !b:show_tag_in_statusline
  else
    let b:show_tag_in_statusline = 1
  endif
endfunction
command! -nargs=0 CurrentTagToggle call ToggleCurrentTag()
nnoremap <leader>ct :CurrentTagToggle<CR>

" UpdateRevisionInfo ---------------------------------- {{{2
" Update revision info of current file
function! UpdateRevisionInfo()
  let b:revision_info = ""
  let b:repos_type = ""

  if expand("%") == ""
    " No existing file is loaded.
    return
  endif

  " lookup path, starts from directory of current file
  " searching up upward, until file system root.
  let l:cur_dir_and_up = expand("%:p:h") . ';'
  let l:repos_info_cmd = ""

  " Is this inside a mercurial repository?
  let l:root = finddir('.hg', l:cur_dir_and_up)
  if l:root != ""
    " this is an hg repos.
    let b:repos_type = "Mercurial"
    if !exists("g:hg_id_flag")
      let g:hg_id_flag = '-Bbint'
    endif
    let l:repos_info_cmd = "hg id " . g:hg_id_flag
  else
    let l:root = finddir('.git', l:cur_dir_and_up)
    if l:root != ""
      "  git repository
      let b:repos_type = "Git"
      let l:repos_info_cmd = "git branch"
    endif
  endif
  " inside repository
  if l:repos_info_cmd != ""
    " root of repository
    let l:repos_root = fnamemodify(l:root, ":p:h")
    " try to get revision info
    let l:info = system("cd " . l:repos_root . " && " . l:repos_info_cmd)
    if v:shell_error == 0
      " with return code 0, assuming nothing went wrong
      if b:repos_type ==# "Git"
        " git does not provide enough customization for output so we need to
        " remove first 2 chars manually, e.g, the '* ' part of '* master'
        let l:info = strpart(l:info, 2)
      endif
      let b:revision_info = substitute(l:info, '\n.*', '', 'g')
    endif
  endif
endfunction

" Load local vimrc if exists -------------------------- {{{1
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
