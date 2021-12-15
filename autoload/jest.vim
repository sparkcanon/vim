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
	execute 'term npx jest --watch ' .. a:args
endfunction
" }}}
