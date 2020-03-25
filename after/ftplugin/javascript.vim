" Useful for include-search e.g., [I
setlocal suffixesadd+=.ts
setlocal suffixesadd+=.js
setlocal suffixesadd+=.jsx
setlocal suffixesadd+=.tsx

setlocal include=\\%(\\<require\\s*(\\s*\\\|\\<import\\>[^;\"']*\\)[\"']\\zs[^\"']*
setlocal define=^\\s*[^/,\\":=]*\\s*[:=]*\\s*\\(class\\\|function\\\|define\\\|export\\s\\(default\\)*\\)[('\"]\\{-\\}

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
