" Purpose: Make
" Source: https://gist.github.com/george-b/6178c350773d78c7d445c58e87ffe10a

" Desc: Run make {{{
function! make#Run(...) abort
  if a:0 == 1
    let &l:makeprg = eval('b:' . a:1 . 'Prg') . ' ' . expand('%')
  elseif a:0 > 1
    let &l:makeprg = eval('b:' . a:1 . 'Prg') . ' ' . expand(join(a:000[1:-1]))
  endif
	silent lmake! | checktime | silent redraw!
	call make#Print()
endfunction
" }}}

" Desc: full screen error list {{{
function! make#Print() abort
	echo "Error List:"
	echo "-----------"
  echo join(g:LastError, "\n") . repeat("\n", &lines - len(g:LastError))
endfunction
" }}}

" vim:foldmethod=marker
