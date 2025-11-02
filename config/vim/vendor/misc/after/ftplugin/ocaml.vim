" set appropriate commentstring to be used by commentary
setlocal commentstring=(*%s*)
inoreabb <buffer> #! #!/usr/bin/env ocaml
" additional merlin keybindings
if !exists('g:merlin_disable_default_keybindings') || !g:merlin_disable_default_keybindings
  map  <silent><buffer> <LocalLeader>e :MerlinErrorCheck<return>
  map  <silent><buffer> <LocalLeader>m :MerlinDestruct<return>
  map  <silent><buffer> <LocalLeader>[ :MerlinPreviousHole<return>
  map  <silent><buffer> <LocalLeader>] :MerlinNextHole<return>
endif
