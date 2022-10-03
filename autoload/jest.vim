" Purpose: Jest

" Desc: List jest tests and run selected {{{
function! jest#picker(A,L,P) abort
	let l:items = systemlist("fd -g {'*.test.*,*-test.*,*-spec.*,*.spec.*'} -E '*.snap'")
	if a:A->len() > 0
		return l:items->matchfuzzy(a:A)
	else
		return l:items
	endif
endfunction
" }}}

" Desc: jest runner {{{
function! jest#runner(args) abort
  if filereadable('./node_modules/.bin/react-scripts')
    execute 'Spawn npx react-scripts test ' .. a:args
  else
    execute 'Spawn npx jest --watch ' .. a:args
  endif
  silent redraw!
endfunction
" }}}
