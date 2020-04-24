 " _____________________ 
" < Elm Compiler >
 " --------------------- 
 "        \   ^__^
 "         \  (oo)\_______
 "            (__)\       )\/\
 "                ||----w |
 "                ||     ||

if exists("current_compiler")
  finish
endif

let current_compiler = "elm-make"

if exists(":CompilerSet") != 2
	command -nargs=* CompilerSet setlocal <args>
endif

" Set errorformat WIP
let &errorformat = '%E%.%#--\ %m\ -%# %f' . ',' .
			\ '%C%l\\|' . ',' .
			\ '%C%.%#'

" let &errorformat = '%.%#path":"%f",'


if executable('elm')
	CompilerSet makeprg=elm\ make
elseif executable('elm-app')
	CompilerSet makeprg=elm-app\ make
endif

" if executable('elm')
" 	CompilerSet makeprg=elm\ make\ --report=json\ --output=/dev/null
" elseif executable('elm-app')
" 	CompilerSet makeprg=elm-app\ make\ --report=json\ --output=/dev/null
" endif
