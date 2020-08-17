"  _______________
" < Eslint Compiler >
"  ---------------
"         \   ^__^
"          \  (oo)\_______
"             (__)\       )\/\
"                 ||----w |
"                 ||     ||

if exists("current_compiler")
  finish
endif

let current_compiler = "Eslint"

if exists(":CompilerSet") != 2
	command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat^=%-P%f,
			\%\\s%#%l:%c\ %#\ %trror\ \ %m,
			\%\\s%#%l:%c\ %#\ %tarning\ \ %m,
			\%-Q,
			\%-G%.%#,

if executable('eslint')
	CompilerSet makeprg=eslint\ --format\ stylish
elseif findfile('eslint', 'node_modules/.bin/') == 'node_modules/.bin/eslint'
	CompilerSet makeprg=node_modules/.bin/eslint\ --format\ stylish
endif
