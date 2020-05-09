"  _______________
" < Jest Compiler >
"  ---------------
"         \   ^__^
"          \  (oo)\_______
"             (__)\       )\/\
"                 ||----w |
"                 ||     ||

if exists("current_compiler")
  finish
endif

let current_compiler = "jest"

if exists(":CompilerSet") != 2
	command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat^=
      \%-G%[%^\ ]%.%#,
      \%A%\\s%\\+●\ %m,
      \%Z%\\s%\\+at\ %.%#\ (%f:%l:%c),
      \%C%.%#,
      \%-G%.%#,

if findfile('jest', 'node_modules/.bin/') == 'node_modules/.bin/jest'
	CompilerSet makeprg=node_modules/.bin/jest
elseif executable('jest')
	CompilerSet makeprg=jest
endif
