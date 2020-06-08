 " ______________ 
" < TSC Compiler >
 " -------------- 
 "        \   ^__^
 "         \  (oo)\_______
 "            (__)\       )\/\
 "                ||----w |
 "                ||     ||

if exists("current_compiler")
  finish
endif

let current_compiler = "tsc"

if exists(":CompilerSet") != 2
	command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat^=%E\ %#%f\ %#(%l\\,%c):\ error\ %m
CompilerSet errorformat+=%W\ %#%f\ %#(%l\\,%c):\ warning\ %m

if findfile('tsc', 'node_modules/.bin/') == 'node_modules/.bin/tsc'
	CompilerSet makeprg=node_modules/.bin/tsc
elseif executable('tsc')
	CompilerSet makeprg=tsc
endif
