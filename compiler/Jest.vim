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

let current_compiler = "Jest"

if exists(":CompilerSet") != 2
	command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat^=%-G%[%^\ ]%.%#,
      \%-G%.%#Test\ suite\ failed\ to\ run,
      \%E%.%#SyntaxError:\ %f:\ %m\ (%l:%c),
      \%E%.%#●\ %m,
      \%Z%.%#at\ %.%#\ (%f:%l:%c),
      \%C%.%#,
      \%-G%.%#

if executable('jest')
	CompilerSet makeprg=jest
elseif findfile('jest', 'node_modules/.bin/') == 'node_modules/.bin/jest'
	CompilerSet makeprg=node_modules/.bin/jest
endif
