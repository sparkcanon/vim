" Purpose: Run make using [c/l]getexpr
" Source: https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3#gistcomment-3246562

" Run make
function! linter#runMake(...) abort
  if empty(a:000)
    let l:args = [expand("%:S")]
  else
    let l:args = a:000
  endif
	return system(join(extend([&makeprg], l:args), ' '))
endfunction

" Run [cl]getexpr using local errorformat, if it's available.
function! linter#getexpr_efm(func, msg) abort
  let l:efm_save = &g:errorformat
  if !empty(&l:errorformat)
    let &g:errorformat = &l:errorformat
  endif
  execute a:func . " a:msg"
  let &g:errorformat = l:efm_save
endfunction
