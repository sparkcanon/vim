 " _____________________ 
" < Javascript Compiler >
 " --------------------- 
 "        \   ^__^
 "         \  (oo)\_______
 "            (__)\       )\/\
 "                ||----w |
 "                ||     ||

if exists("current_compiler")
  finish
endif

let current_compiler = "eslint"

if exists(":CompilerSet") != 2
	command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat+=%E%f:\ line\ %l\\,\ col\ %c\\,\ Error\ -\ %m,
CompilerSet errorformat+=%W%f:\ line\ %l\\,\ col\ %c\\,\ Warning\ -\ %m,%-G%.%#

if findfile('eslint', 'node_modules/.bin/') == 'node_modules/.bin/eslint'
	CompilerSet makeprg=node_modules/.bin/eslint\ -f\ compact
elseif executable('eslint')
	CompilerSet makeprg=eslint\ -f\ compact
endif
