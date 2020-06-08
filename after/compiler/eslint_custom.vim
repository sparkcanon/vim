 " _____________________ 
" < Javascript Compiler >
 " --------------------- 
 "        \   ^__^
 "         \  (oo)\_______
 "            (__)\       )\/\
 "                ||----w |
 "                ||     ||

 " TODO: Should this be removed now that eslint compiler exists in vim runtime
 " files ?

if exists("current_compiler")
  finish
endif

let current_compiler = "eslint_custom"

if exists(":CompilerSet") != 2
	command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat+=%E%f:\ line\ %l\\,\ col\ %c\\,\ Error\ -\ %m
CompilerSet errorformat+=%W%f:\ line\ %l\\,\ col\ %c\\,\ Warning\ -\ %m,%-G%.%#

if findfile('eslint', 'node_modules/.bin/') == 'node_modules/.bin/eslint'
	CompilerSet makeprg=node_modules/.bin/eslint\ -f\ compact
elseif executable('eslint')
	CompilerSet makeprg=eslint\ -f\ compact
endif

finish " For eslint -f stylish
" Source: https://github.com/wincent/wincent/blob/master/aspects/vim/files/.vim/after/compiler/eslint.vim#L30
" CompilerSet errorformat=
"       \%-P%f,
"       \%\\s%#%l:%c%\\s%\\+%trror%\\s%\\+%m,
"       \%\\s%#%l:%c%\\s%\\+%tarning%\\s%\\+%m,
"       \%-Q,
"       \%-G%.%#

