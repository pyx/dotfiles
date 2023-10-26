" set appropriate commentstring to be used by commentary
setlocal commentstring=;\ %s
inoreabb <buffer> #! #!/usr/bin/env hy
inoreabb <buffer> ;e ;; -*- coding: utf-8 -*-
inoreabb <buffer> pdb; (do (import pdb) (.set-trace pdb))

nnoremap <buffer> <leader>rp :RainbowToggle<cr>
