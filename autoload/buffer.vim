" Purpose: Buffer list

" Desc: List jest tests and run selected {{{
function! buffer#picker() abort
  call quickpick#open({
    \ 'items': getcompletion('', 'buffer'),
    \ 'on_accept': function('s:on_accept'),
		\ 'on_vsplit': function('s:on_vsplit'),
		\ 'on_split': function('s:on_split'),
		\ 'on_tabnew': function('s:on_tabnew'),
		\ 'on_bufdel': function('s:on_bufdel')
    \ })
endfunction

" Desc: On accept event
function! s:on_accept(data, ...) abort
  call quickpick#close()
  execute 'b ' . a:data['items'][0]
endfunction

function! s:on_vsplit(data, ...) abort
  call quickpick#close()
	execute 'vsp ' . a:data['items']
endfunction

function! s:on_split(data, ...) abort
  call quickpick#close()
	execute 'split ' . a:data['items']
endfunction

function! s:on_tabnew(data, ...) abort
  call quickpick#close()
	execute 'tab sbuffer ' . a:data['items']
endfunction

function! s:on_bufdel(data, ...) abort
  call quickpick#close()
	execute 'bdelete ' . a:data['items']
endfunction
" }}}

