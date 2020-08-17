"  _______________
" < Tsc Compiler >
"  ---------------
"         \   ^__^
"          \  (oo)\_______
"             (__)\       )\/\
"                 ||----w |
"                 ||     ||

if exists("current_compiler")
  finish
endif

let current_compiler = "Tsc"

if exists(":CompilerSet") != 2
	command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat^=%E%f\ %#(%l\\,%c):\ %trror\ TS%n:\ %m,
			\%W%f\ %#(%l\\,%c):\ %tarning\ TS%n:\ %m,

if executable('tsc')
	CompilerSet makeprg=tsc\ --noEmit\ --jsx\ react
elseif findfile('tsc', 'node_modules/.bin/') == 'node_modules/.bin/jest'
	CompilerSet makeprg=node_modules/.bin/tsc\ --noEmit\ --jsx\ react
endif
