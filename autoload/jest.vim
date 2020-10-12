" Purpose: Jest utils

" Desc: List jest tests and run selected {{{
function! jest#picker() abort
	let l:items = systemlist('fd -g {"*.test.*,*-test.*"} --base-directory ~/Documents/work_projects/tesco/lego-web/web/')
  call quickpick#open({
    \ 'items': l:items,
    \ 'on_accept': function('s:on_accept'),
    \ })
endfunction

" Desc: On accept event
function! s:on_accept(data, ...) abort
  call quickpick#close()
  execute 'term fish -c "cd web && node_modules/.bin/jest --watch ' . a:data['items'][0]
endfunction
" }}}

" vim:foldmethod=marker
