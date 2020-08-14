" Purpose: JS specific include-search, define-search settings, path commands

" Section: suffixesadd, include, define, matchit, path, compiler, format util {{{
" Useful for include-search e.g., [I
setlocal suffixesadd+=.js,.jsx,.ts,.tsx,.vue
setlocal isfname+=@-@,#-#

" Make Vim recognize ES6 import statements
let &l:include = 'from\|require'
let &l:includeexpr="substitute(v:fname, '#', 'web', '')"

" Make Vim use ES6 export statements as define statements
let &l:define = '\v(export\s+(default\s+)?)?(var|let|const|(async\s+)?function|class)|export\s+'

" Set standard javascript path
let &l:path = '.,,'
			\ . 'src/**'

" Matchit words
let b:match_words = '\<function\>:\<return\>,'
      \ . '\<if\>:\<else\>,'
      \ . '\<switch\>:\<case\>:\<default\>,'
      \ . '\<do\>:\<while\>,'
      \ . '\<try\>:\<catch\>:\<finally\>,'

" Prgs
" Eslint make
let b:LintPrg = 'eslint -f compact'
" Eslint errorformat
let b:LintEfm = '%f: line %l\, col %c\, %trror %m,%f: line %l\, col %c\, %twarning %m,%-G%.%#,'
" Jest make
let b:TestPrg = 'jest'
" Jest errorformat
let b:TestEfm = '%-G%[%^ ]%.%#,' .
      \ '%A%\s%\+● %m,' .
      \ '%Z%\s%\+at %.%# (%f:%l:%c),' .
      \ '%C%.%#,' .
      \ '%-G%.%#,'
" Tsc make
let b:TscPrg = 'tsc --noEmit --jsx react'
" Tsc errorformat
let b:TscEfm = '%E %#%f %#(%l\,%c): %trror %m,%W %#%f %#(%l\,%c): %tarning %m,'
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
