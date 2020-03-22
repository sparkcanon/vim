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

let current_compiler = "js"

if exists(":CompilerSet") != 2
	command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %trror\ -\ %m,%-G%.%#
CompilerSet errorformat+=%f:\ line\ %l\\,\ col\ %c\\,\ %tarning\ -\ %m,%-G%.%#

CompilerSet makeprg=eslint\ -f\ compact\ 
