" -*- vim: set sts=2 sw=2 et fdm=marker: -------------  vim modeline -*-
" [Pathogen] ------------------------------------------ {{{1
call pathogen#infect()

" Basic Settings -------------------------------------- {{{1
syntax on
set nocompatible
filetype plugin indent on

set hidden
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

" tabs and spaces
set listchars+=tab:▸\ ,trail:⋅,nbsp:⋅
" eols and others
set listchars+=eol:¬,extends:»,precedes:«

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
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType python inoreab <buffer> #! #!/usr/bin/env python
    autocmd FileType python inoreab <buffer> #e # -*- coding: utf=8 -*-
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

  " py.test Support ----------------------------------- {{{2
  augroup pytest
    au!
    autocmd FileType python nnoremap <buffer> <silent> <localleader>tf <Esc>:Pytest function looponfail<CR>
    autocmd FileType python nnoremap <buffer> <silent> <localleader>tc <Esc>:Pytest class looponfail<CR>
    autocmd FileType python nnoremap <buffer> <silent> <localleader>tm <Esc>:Pytest method looponfail<CR>
    autocmd FileType python nnoremap <buffer> <silent> <localleader>tt <Esc>:Pytest file looponfail<CR>
    autocmd FileType python nnoremap <buffer> <silent> <localleader>tC <Esc>:Pytest clear<CR>
    autocmd FileType python nnoremap <buffer> <silent> <localleader>te <Esc>:Pytest error<CR>
    autocmd FileType python nnoremap <buffer> <silent> <localleader>tn <Esc>:Pytest next<CR>
    autocmd FileType python nnoremap <buffer> <silent> <localleader>tp <Esc>:Pytest previous<CR>
    autocmd FileType python nnoremap <buffer> <silent> <localleader>tF <Esc>:Pytest fails<CR>
    autocmd FileType python nnoremap <buffer> <silent> <localleader>ts <Esc>:Pytest session<CR>

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

  " Default whitespace settings for different file types ----- {{{2
  augroup whitespace_settings
    au!
    " Indentation with hard tabs:
    " set 'shiftwidth' and 'tabstop' to the same amount, usually less than 8
    " for better viewing, leaving 'softtabstop' unset and 'expandtab' at
    " default value
    autocmd FileType go setlocal sw=4 ts=4
    autocmd FileType java setlocal sw=4 ts=4
    autocmd FileType php setlocal sw=4 ts=4
    autocmd FileType rust setlocal sw=4 ts=4
    " Indentation with spaces:
    " set 'shiftwidth' and 'softtabstop' to the same amount, usually turn on
    " 'expandtab' to avoid mixing spaces and tabs, leaving 'tabstop' at
    " default value.
    autocmd FileType asciidoc setlocal sw=2 sts=2 et
    autocmd FileType c setlocal sw=4 sts=4 et tw=78
    autocmd FileType coffee setlocal sw=2 sts=2 et tw=79
    autocmd FileType cpp setlocal sw=4 sts=4 et tw=78
    autocmd FileType css setlocal sw=4 sts=4 et
    autocmd FileType haskell setlocal sw=4 sts=4 et
    autocmd FileType html setlocal sw=2 sts=2 et
    autocmd FileType htmlcheetah setlocal sw=2 sts=2 et
    autocmd FileType htmldjango setlocal sw=2 sts=2 et
    autocmd FileType javascript setlocal sw=2 sts=2 et
    autocmd FileType jinja setlocal sw=2 sts=2 et
    autocmd FileType jinja2 setlocal sw=2 sts=2 et
    autocmd FileType mason setlocal sw=2 sts=2 et
    autocmd FileType ocaml setlocal sw=2 sts=2 et
    autocmd FileType perl setlocal sw=4 sts=4 et
    autocmd FileType rst setlocal sw=2 sts=2 et
    autocmd FileType ruby setlocal sw=2 sts=2 et
    autocmd FileType python setlocal sw=4 sts=4 et tw=78
    autocmd FileType scheme setlocal sw=2 sts=2 et
    autocmd FileType vala setlocal sw=4 sts=4 et tw=78
    autocmd FileType xhtml setlocal sw=2 sts=2 et
    autocmd FileType xml setlocal sw=2 sts=2 et
    " Others with special requirements
    autocmd FileType make setlocal noet
    autocmd FileType sql setlocal et
    autocmd FileType gitcommit setlocal textwidth=72
    autocmd FileType hgcommit setlocal textwidth=72
    autocmd FileType text setlocal textwidth=72

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

  " quicktask filetype -------------------------------- {{{2
  augroup quicktask_ft
    au!
    autocmd BufNewFile,BufRead *.quicktask setf quicktask

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
    " and emails and plain text files
    autocmd FileType mail,text setlocal spell
    " except 'help' files
    autocmd BufEnter *.txt if &filetype == 'help' | setlocal nospell | endif

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
" blackboard    | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" bocau         | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" candycode     | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" clarity       | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" cloudy        | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" darkburn      | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✗       | ✓    | ✓
" fruity        | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" fu            | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" gentooish     | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" harlequin     | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" hemisu        | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" hybrid        | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✗       | ✓    | ✓
" inkpot        | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" ir_black      | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✗       | ✓    | ✓
" jellybeans    | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✗       | ✓    | ✓
" jellyx        | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
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
" pablo         | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" peaksea       | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" peppers       | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" redblack      | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" relaxedgreen  | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" phd           | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" sift          | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" slate         | dark       | ✓     | ✓    | ✓   | ✓          | ✗      | ✓       | ✓    | ✓
" twilight      | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" Tomorrow-N    | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✗    | ✓
" Tomorrow-N-BL | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✗    | ✓
" Tomorrow-N-BR | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✗    | ✓
" Tomorrow-N-E  | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✗    | ✓
" vj            | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" vividchalk    | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" wintersday    | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" wombat        | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" zenburn       | dark       | ✓     | ✓    | ✓   | ✓          | ✓      | ✗       | ✓    | ✓
" solarized     | light/dark | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" kib_plastic   | light      | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" mayansmoke    | light      | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" proton        | light      | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓
" pyte          | light      | ✓     | ✓    | ✓   | ✓          | ✓      | ✓       | ✓    | ✓

" badwolf:
" http://stevelosh.com/projects/badwolf/
" https://bitbucket.org/sjl/badwolf/
" hg clone https://bitbucket.org/sjl/badwolf
"
" hemisu:
" only works in gVim
"
" hybrid:
" https://github.com/w0ng/vim-hybrid/
" git clone git://github.com/w0ng/vim-hybrid.git
"
" ir_black:
" http://blog.toddwerth.com/entries/8
" http://blog.toddwerth.com/entry_files/8/ir_black.vim
"
" harlequin:
" http://www.vim.org/scripts/script.php?script_id=4195
" https://github.com/nielsmadan/harlequin
" git clone git://github.com/nielsmadan/harlequin.git
"
" solarized:
" http://ethanschoonover.com/solarized
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

" Plugins --------------------------------------------- {{{1
" ack.vim, Ack front-end for vim ---------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2572
" https://github.com/mileszs/ack.vim
" git clone git://github.com/mileszs/ack.vim.git
" used Ag instead.
" https://github.com/ggreer/the_silver_searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

" Clam ------------------------------------------------ {{{2
" http://www.vim.org/scripts/script.php?script_id=4000
" https://github.com/sjl/clam.vim
" https://bitbucket.org/sjl/clam.vim/
" hg clone https://bitbucket.org/sjl/clam.vim
nnoremap <leader>c :Clam<Space>

" Conque ---------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2771
" http://code.google.com/p/conque/
" svn checkout http://conque.googlecode.com/svn/trunk/ conque
"
" interactive shell in vim buffer
" Bash
nnoremap <leader>sh :ConqueTermSplit bash<CR>
" Python Shell
nnoremap <leader>py :ConqueTermSplit python<CR>
" gdb
nnoremap <leader>gdb :ConqueTermSplit gdb<CR>

" Ctrl-P ---------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=3736
" http://kien.github.com/ctrlp.vim/
" https://bitbucket.org/kien/ctrlp.vim
" git clone git://github.com/kien/ctrlp.vim.git
"
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
" switching between buffers
nnoremap <C-N> :CtrlPBuffer<CR>
" works in gvim and some terminals.
nnoremap <C-A-P> :CtrlPMixed<CR>

" Cute Python ----------------------------------------- {{{2
" https://github.com/ehamberg/vim-cute-python
" #git clone git://github.com/ehamberg/vim-cute-python.git

" dot.vim --------------------------------------------- {{{2
" https://bitbucket.org/shu/dotoutlinetree
" http://www.vim.org/scripts/script.php?script_id=1225

" FuzzyFinder ----------------------------------------- {{{2
" vim-l9 is the requirement of fuzzyfinder 4.*
" http://www.vim.org/scripts/script.php?script_id=3252
" http://bitbucket.org/ns9tks/vim-l9/
" #hg clone https://bitbucket.org/ns9tks/vim-l9
"
" http://www.vim.org/scripts/script.php?script_id=1984
" http://bitbucket.org/ns9tks/vim-fuzzyfinder/
" #hg clone https://bitbucket.org/ns9tks/vim-fuzzyfinder
"
" mapping for FuzzyFinder
" use V 3.4
"nnoremap <leader>ff :FufFile ~/projects/<CR>
" search from cwd
" nnoremap <leader>ff :FufFile<CR>
" nnoremap <leader>fb :FufBuffer<CR>

" Gundo ----------------------------------------------- {{{2
" http://sjl.bitbucket.org/gundo.vim/
" hg clone https://bitbucket.org/sjl/gundo.vim
nnoremap <leader>u :GundoToggle<CR>

" Haskell Conceal ------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=3200
" https://github.com/Twinside/vim-haskellConceal
" #git clone git://github.com/Twinside/vim-haskellConceal.git

" Haskell Mode ---------------------------------------- {{{2
" http://projects.haskell.org/haskellmode-vim/
" installed from gentoo haskell overlay
let g:haddock_browser = '/usr/bin/firefox-bin'

" Indent Guides --------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=3361
" https://github.com/nathanaelkane/vim-indent-guides
" git clone git://github.com/vim-scripts/Indent-Guides.git

" Indent Python --------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=974
" https://github.com/vim-scripts/indentpython.vim
" git clone git://github.com/vim-scripts/indentpython.vim.git
"
" This one is compatible with PEP8, way better than the one bundled with vim.

" matchit.vim ----------------------------------------- {{{2
" enable matchit.vim
runtime macros/matchit.vim

" NERDTree -------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=1658
" https://github.com/scrooloose/nerdtree
" #git clone git://github.com/scrooloose/nerdtree.git
" nnoremap <leader>nt :NERDTreeToggle<CR>

" NrrwRgn --------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=3075
" https://github.com/chrisbra/NrrwRgn
" git clone git://github.com/chrisbra/NrrwRgn.git

" Pathogen -------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2332
" https://github.com/tpope/vim-pathogen
" git clone git://github.com/tpope/vim-pathogen.git

" py.test --------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=3424
" https://github.com/alfredodeza/pytest.vim.git
" git clone git://github.com/alfredodeza/pytest.vim.git

" quicktask ------------------------------------------- {{{2
" http://quicktask.aaronbieber.com/
" https://github.com/aaronbieber/quicktask
" git clone git://github.com/aaronbieber/quicktask.git
let g:quicktask_snip_path = expand("~/.snips")

" Rainbow Parentheses --------------------------------- {{{2
" https://github.com/kien/rainbow_parentheses.vim
" #git clone git://github.com/kien/rainbow_parentheses.vim.git

" Scratch --------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=664
" https://github.com/vim-scripts/scratch.vim
" git clone git://github.com/vim-scripts/scratch.vim.git
nnoremap <leader><Space> :Sscratch<CR>

" Splice ---------------------------------------------- {{{2
" https://bitbucket.org/sjl/splice.vim
" https://github.com/sjl/splice.vim
" hg clone https://bitbucket.org/sjl/splice.vim

" Slimv ----------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2531
" https://bitbucket.org/kovisoft/slimv/
" hg clone https://bitbucket.org/kovisoft/slimv
let g:slimv_swank_cmd = '! gnome-terminal -e "sbcl --load ' . $HOME . '/.vim/bundle/slimv/slime/start-swank.lisp" &'

" snipMate -------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2540
" http://github.com/msanders/snipmate.vim
" #git clone git://github.com/msanders/snipmate.vim.git

" Sparkup --------------------------------------------- {{{2
" You can write HTML in a CSS-like syntax, and have Sparkup handle the
" expansion to full HTML code.
" http://github.com/rstacruz/sparkup
" git clone git://github.com/rstacruz/sparkup.git
"
" try this:
" ihtml:xxs>#wrapper>#nav>h2{navigation}+ul>li#id_$*3>a<<<#main{Page Content}+div#footer{Footer}<c-tab>
let g:sparkupExecuteMapping = '<C-]>'
let g:sparkupNextMapping = '<C-J>'

" SuperTab -------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=1643
" https://github.com/ervandew/supertab
" #git clone git://github.com/ervandew/supertab.git

" Surround -------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=1697
" https://github.com/tpope/vim-surround
" git clone git://github.com/tpope/vim-surround.git

" Syntastic ------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2736
" https://github.com/scrooloose/syntastic
" git clone git://github.com/scrooloose/syntastic.git
nnoremap <leader>st :SyntasticToggleMode<CR>

" Tabular --------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=3464
" https://github.com/godlygeek/tabular
" git clone git://github.com/godlygeek/tabular.git

" Tagbar ---------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=3465
" http://github.com/majutsushi/tagbar
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

" Taglist --------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=273
" http://vim-taglist.sourceforge.net/
"nnoremap <leader>tl :TlistToggle<CR>

" TaskList -------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2607
nnoremap <leader>tl :TaskList<CR>

" UltiSnips ------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2715
" official mirror: https://github.com/sirver/ultisnips
" git clone git://github.com/vim-scripts/UltiSnips.git
"
" TextMate style:
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
" local snippets only:
"let g:UltiSnipsSnippetDirectories = ["snippets"]
" Snippets dir
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "snippets"]
" vsplit the snippets edit window
let g:UltiSnipsEditSplit = 'vertical'

" Vim CSS Color --------------------------------------- {{{2
" https://github.com/skammer/vim-css-color
" #git clone git://github.com/skammer/vim-css-color.git
"
" ap's clone, this one has way shorter startup time.
" https://github.com/ap/vim-css-color
" git clone git://github.com/ap/vim-css-color.git
"
" let g:cssColorVimDoNotMessMyUpdatetime = 1

" vim-coffee-script ----------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=3590
" https://github.com/kchmck/vim-coffee-script
" git clone git://github.com/kchmck/vim-coffee-script.git

" vim-commentary -------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=3695
" https://github.com/tpope/vim-commentary
" git clone git://github.com/tpope/vim-commentary.git

" vim-indent-object ----------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=3037
" https://github.com/michaeljsmith/vim-indent-object
" git clone git://github.com/michaeljsmith/vim-indent-object.git

" vim-lawrencium -------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=3861
" https://bitbucket.org/ludovicchabant/vim-lawrencium
" hg clone https://bitbucket.org/ludovicchabant/vim-lawrencium

" VimIm ----------------------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2506
" http://code.google.com/p/vimim/
" https://github.com/vimim/vimim
" #svn checkout https://vimim.googlecode.com/svn/trunk/ vimim
" git clone git://github.com/vimim/vimim.git
"
" vimim settings, show menu background color
let g:vimim_cloud = -1
"let g:vimim_map = 'c-bslash'
"let g:vimim_mode = 'static'
"let g:vimim_mycloud = 0
let g:vimim_toggle = 'pinyin'

" xpt, XP Templates ----------------------------------- {{{2
" http://www.vim.org/scripts/script.php?script_id=2611
" http://code.google.com/p/xptemplate
" https://github.com/drmingdrmer/xptemplate
" #git clone git://github.com/drmingdrmer/xptemplate.git
"
" use <Tab> key as trigger
" let g:xptemplate_key = '<Tab>'
" no spaces inside ()
" let g:xptemplate_vars = "SParg="
"
" not going to set it now.
" let g:xptemplate_vars = "author=somebody&email=nobody@gmail.com"

" ZenCoding.vim --------------------------------------- {{{2
" vim plugins for HTML and CSS hi-speed coding.
" http://www.vim.org/scripts/script.php?script_id=2981
" http://mattn.github.com/zencoding-vim/
" https://github.com/mattn/zencoding-vim/
" #git clone git://github.com/mattn/zencoding-vim.git
"
" This one has more features, I am not using this one right now.
" It doesn't honor my sw, sts settings.

" Commands, Mappings and Functions -------------------- {{{1
" <Space> in Normal mode ------------------------------ {{{2
" Center current line
"nnoremap <Space> zz
" Center current line, reset number and highlighting for search
nnoremap <Space> zz:set number<CR>:nohlsearch<CR>
" Next empty Line
"nnoremap <Space> }
" Insert one character
"nnoremap <Space> i_<Esc>r
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

" Mercurial Helpers ----------------------------------- {{{2
" by Steve Losh
" https://bitbucket.org/sjl
" https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
function! s:HgDiff()
  diffthis

  let fn = expand('%:p')
  let ft = &ft

  wincmd v
  edit __hgdiff_orig__

  setlocal buftype=nofile

  normal ggdG
  execute "silent r!hg cat --rev . " . fn
  normal ggdd

  execute "setlocal ft=" . ft

  diffthis
  diffupdate
endfunction
command! -nargs=0 HgDiff call s:HgDiff()
nnoremap <leader>hd :HgDiff<cr>

function! s:HgBlame()
  let fn = expand('%:p')

  wincmd v
  wincmd h
  edit __hgblame__
  vertical resize 28

  setlocal scrollbind winfixwidth nolist nowrap nonumber buftype=nofile ft=none

  normal ggdG
  execute "silent r!hg blame -undq " . fn
  normal ggdd
  execute ':%s/\v:.*$//'

  wincmd l
  setlocal scrollbind
  syncbind
endfunction
command! -nargs=0 HgBlame call s:HgBlame()
nnoremap <leader>hb :HgBlame<cr>

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

  if glob("%") == ""
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
        " git does not provide enough customization of output as we need
        " remove first 2 chars, e.g, the '* ' part of '* master'
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
