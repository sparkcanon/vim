" Purpose: Fuzzy find files utils

" Desc: Fuzzy search files in project {{{
function! files#picker() abort
	let l:items = systemlist('fd -E "*.snap" -E test/ -E bin/ -E eslint/ -E tests_utils/ -E docs/ -E backstop_data/ -E pack/ -E __mocks__/')
	call quickpick#open({
				\ 'items': l:items,
				\ 'on_accept': function('s:on_accept'),
				\ })
endfunction

" Desc: On accept event
function! s:on_accept(data, ...) abort
	call quickpick#close()
	execute 'e ' . a:data['items'][0]
endfunction
" }}}

" vim:foldmethod=marker
