" vimwiki
" Removed default mappings, conflicting with system input method
nmap <buffer> <C-Space> <Nop>
vmap <buffer> <C-Space> <Nop>
nmap <buffer> <silent> <Space> <Plug>VimwikiToggleListItem
vmap <buffer> <silent> <Space> :VimwikiToggleListItem<CR>
