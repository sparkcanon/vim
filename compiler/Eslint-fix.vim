"  _______________
" < Eslint-fix Compiler >
"  ---------------
"         \   ^__^
"          \  (oo)\_______
"             (__)\       )\/\
"                 ||----w |
"                 ||     ||

if exists("current_compiler")
  finish
endif

let current_compiler = "Eslint-fix"

if exists(":CompilerSet") != 2
	command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat^=%-P%f,
			\%.%#%l:%c\ %#\ %trror\ \ %m,
			\%.%#%l:%c\ %#\ %tarning\ \ %m,
			\%-Q,
			\%-G%.%#,

if findfile('eslint', 'node_modules/.bin/') == 'node_modules/.bin/eslint'
	CompilerSet makeprg=node_modules/.bin/eslint\ --fix
elseif executable('eslint')
	CompilerSet makeprg=eslint\ --fix
endif
