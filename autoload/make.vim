" Purpose: Make

" Desc: Run makery with args {{{
function! make#runMakery(...) abort
	if a:0 == 1
		execute 'LM' . a:1 . '! ' . expand('%')
	elseif a:0 > 1
		execute 'LM' . a:1 . '! ' . expand(join(a:000[1:-1]))
	endif
endfunction
" }}}

" Desc: full screen error list {{{
function! make#Print() abort
	if len(g:LastError) > 0
		let l:title =  "Error List for " . expand('%') . ":"
		echo l:title
		echo repeat('-', len(l:title))
		echo join(g:LastError, "\n") . repeat("\n", &lines - len(g:LastError))
	else
		echo "No errors"
	endif
endfunction
" }}}

" vim:foldmethod=marker
