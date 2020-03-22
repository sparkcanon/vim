if exists("current_compiler")
  finish
endif

let current_compiler = "ts"

if exists(":CompilerSet") != 2
	command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat=%A\ %#%f\ %#(%l\\\,%c):\ %trror%m,%C%m,%A\ %#%f\ %#(%l\\\,%c):\ %tarning%m,%C%m

" WIP
" CompilerSet errorformat=%f:%l\\:%c\\\ -\ %trror\ %m.
" CompilerSet errorformat=%f:%l\\:%c\\\ -\ %tarning\ %m.

CompilerSet makeprg=tsc\ 
