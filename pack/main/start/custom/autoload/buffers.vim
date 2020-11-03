" Purpose: Buffers

" Desc: Buffers picker {{{
function! buffers#picker(A,L,P) abort
	let l:items = getcompletion('','buffer')
	if a:A->len() > 0
		return l:items->matchfuzzy(a:A)
	else
		return l:items
	endif
endfunction
" }}}

" Desc: Buffers runner {{{
function! buffers#runner(args, mod) abort
	exe a:mod a:args
endfunction
" }}}
