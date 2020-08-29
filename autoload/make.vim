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

" vim:foldmethod=marker
