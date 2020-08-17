" Purpose: Make
" Source: https://gist.github.com/george-b/6178c350773d78c7d445c58e87ffe10a

" Desc: Run make & restore efm {{{
function! make#Run(...) abort

	if !exists('b:' . a:1 . 'Prg') || !exists('b:' . a:1 . 'Efm')
		echo "ERROR: " . a:1 . " Prg/Efm not defined for current file type."
		return
	endif

	let &l:errorformat = eval('b:' . a:1 . 'Efm')
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
