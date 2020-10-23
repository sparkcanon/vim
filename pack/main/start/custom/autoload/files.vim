" Purpose: Files

" Desc: Files picker {{{
function! files#picker(A,L,P) abort
	let l:cmd = 'fd . -t f -E test/ -E bin/ -E eslint/ -E __mocks__/ -E tests_utils/ -E docs/ -E backstop_data/ -E __snapshots__'
	let l:items = systemlist(l:cmd)
	if a:A->len() > 0
		return l:items->matchfuzzy(a:A)
	else
		return l:items
	endif
endfunction

" Desc: Files runner
function! files#runner(args) abort
	exe 'e ' .. a:args
endfunction
" }}}
