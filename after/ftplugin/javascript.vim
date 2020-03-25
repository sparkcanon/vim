" Purpose: include-search, define-search settings, path and JS specific
" commands

" Useful for include-search e.g., [I
setlocal suffixesadd+=.ts
setlocal suffixesadd+=.js
setlocal suffixesadd+=.jsx
setlocal suffixesadd+=.tsx

setlocal include=\\%(\\<require\\s*(\\s*\\\|\\<import\\>[^;\"']*\\)[\"']\\zs[^\"']*

" Source: https://gist.github.com/romainl/a50b49408308c45cc2f9f877dfe4df0c#file-typescript-vim-L242
let &l:define  = '^\s*\('
             \ . '\(export\s\)*\(default\s\)*\(var\|const\|let\|function\|class\|interface\)\s'
             \ . '\|\(public\|private\|protected\|readonly\|static\)\s'
             \ . '\|\(get\s\|set\s\)'
             \ . '\|\(export\sdefault\s\|abstract\sclass\s\)'
             \ . '\|\(async\s\)'
             \ . '\|\(\ze\i\+([^)]*).*{$\)'
             \ . '\)'

" Tesco Lego stuff
source <sfile>:h/lego.vim

compiler eslint

" Make on all open buffers
command! -nargs=0 MassMake call functions#massMake()

" Console log command
command! -nargs=0 Log execute "normal oconsole.log('".expand('<cword>')
			\ . "====> ', ".expand('<cword>').")"

" Add import statement
command! -nargs=0 ImportJs execute "normal ggOimport { ".expand('<cword>')." } from '';"
