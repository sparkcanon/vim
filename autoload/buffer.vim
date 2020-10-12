" Purpose: Buffer list

" Desc: List jest tests and run selected {{{
function! buffer#picker() abort
  call quickpick#open({
    \ 'items': getcompletion('', 'buffer'),
    \ 'on_accept': function('s:on_accept'),
    \ })
endfunction

" Desc: On accept event
function! s:on_accept(data, ...) abort
  call quickpick#close()
  execute 'b ' . a:data['items'][0]
endfunction
" }}}

" vim:foldmethod=marker
