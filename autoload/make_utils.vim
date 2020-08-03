" Purpose: Run make using [c/l]getexpr
" Source: https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3#gistcomment-3246562

" Desc: Run make {{{
function! make_utils#runMake(...) abort
  if empty(a:000)
    let l:args = [expand("%:S")]
  else
    let l:args = a:000
  endif
	return system(join(extend([&makeprg], l:args), ' '))
endfunction
" }}}

" Desc: Run [cl]getexpr using local errorformat, if it's available. {{{
function! make_utils#getexpr_efm(func, msg) abort
  let l:efm_save = &g:errorformat
  if !empty(&l:errorformat)
    let &g:errorformat = &l:errorformat
  endif
  execute a:func . " a:msg"
  let &g:errorformat = l:efm_save
endfunction
" }}}

" Desc: Run make on all loaded browsers {{{
" TODO: Check if buffers are laoded
function! make_utils#massMake() abort
	let buffers = []
	for number in range(bufnr('$'))
		call add(buffers, bufname(number))
	endfor
	execute 'Make! ' .. join(buffers, ' ')
endfunction
" }}}

" vim:foldmethod=marker
