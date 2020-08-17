" Purpose: JS/TS specific settings

" Section: Compilers & errorformats {{{
" Note: Add a comma after efms
" Eslint Prg
let b:LintPrg = 'eslint --format stylish'
" Eslint errorformat
let b:LintEfm = '%-P%f,' .
			\ '%.%#%l:%c %# %trror  %m,' .
			\ '%.%#%l:%c %# %tarning  %m,' .
			\ '%-Q,' .
			\ '%-G%.%#,'

" Eslint fix prg
let b:FixPrg = 'eslint --fix'
" Eslint errorformat
let b:FixEfm = '%-P%f,' .
			\ '%.%#%l:%c %# %trror  %m,' .
			\ '%.%#%l:%c %# %tarning  %m,' .
			\ '%-Q,' .
			\ '%-G%.%#,'

" Jest Prg
let b:TestPrg = 'jest'
" Jest errorformat
let b:TestEfm = '%-G%[%^ ]%.%#,' .
      \ '%-G%.%#Test suite failed to run,' .
      \ '%E%.%#SyntaxError: %f: %m (%l:%c),' .
      \ '%E%.%#● %m,' .
      \ '%Z%.%#at %.%# (%f:%l:%c),' .
      \ '%C%.%#,' .
      \ '%-G%.%#'

" Tsc Prg
let b:TscPrg = 'tsc --noEmit --jsx react'
" Tsc errorformat
let b:TscEfm = '%E%f %#(%l\,%c): %trror TS%n: %m,%W%f %#(%l\,%c): %tarning TS%n: %m,'
" }}}

" Section: suffixesadd, include, define, matchit, path {{{
" Useful for include-search e.g., [I
setlocal suffixesadd+=.js,.jsx,.ts,.tsx,.vue
setlocal isfname+=@-@,#-#

" Make Vim recognize ES6 import statements
let &l:include = 'from\|require'
let &l:includeexpr="substitute(v:fname, '#', 'web', '')"

" Make Vim use ES6 export statements as define statements
let &l:define = '\v(export\s+(default\s+)?)?(var|let|const|(async\s+)?function|class)|export\s+'

" Matchit words
let b:match_words = '\<function\>:\<return\>,'
      \ . '\<if\>:\<else\>,'
      \ . '\<switch\>:\<case\>:\<default\>,'
      \ . '\<do\>:\<while\>,'
      \ . '\<try\>:\<catch\>:\<finally\>,'
" }}}

" Section: Commands & Mappings {{{
" Console log command
command! -nargs=0 Log execute "normal oconsole.log('".expand('<cword>')
      \ . "====> ', ".expand('<cword>').")"

command! -nargs=0 -range LogVisual execute "normal oconsole.log('". utils#getVisualSelection()
      \ . "====> ', ". utils#getVisualSelection() .")"

" Add import statement
command! -nargs=0 ImportJs execute "normal ggOimport { ".expand('<cword>')." } from '';"
" }}}

" vim:foldmethod=marker
