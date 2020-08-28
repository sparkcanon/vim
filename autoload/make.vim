" Purpose: Make

" Desc: Run makery with args {{{
function! make#runMakery(...) abort
	if a:0 == 1
		execute 'LM' . a:1 . '! ' . expand('%')
	elseif a:0 > 1
		execute 'LM' . a:1 . '! ' . expand(join(a:000[1:-1]))
	endif
	call make#Print()
endfunction
" }}}

" Desc: full screen error list {{{
function! make#Print() abort
	if exists('g:LastError') && len(g:LastError) > 0
		call popup_create(g:LastError, #{
					\ title: ' Error List ',
					\ moved: 'any',
					\ pos: 'center',
					\ highlight: 'Normal',
					\ border: [],
					\ padding: [0,2,0,2]
					\ })
	endif
endfunction
" }}}

" vim:foldmethod=marker
