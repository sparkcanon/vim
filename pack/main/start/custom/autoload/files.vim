" Purpose: Fuzzy find files utils

" Desc: Fuzzy search files in project {{{
function! files#picker() abort
	let l:items = systemlist('fd -t f -E "*.snap" -E test/ -E bin/ -E eslint/ -E tests_utils/ -E docs/ -E backstop_data/ -E pack/ -E __mocks__/')
	call quickpick#open({
				\ 'items': l:items,
				\ 'on_accept': function('s:on_accept'),
				\ 'on_vsplit': function('s:on_vsplit'),
				\ 'on_split': function('s:on_split'),
				\ 'on_tabnew': function('s:on_tabnew'),
				\ })
endfunction

" Desc: On accept event
function! s:on_accept(data, ...) abort
	call quickpick#close()
	execute 'e ' . a:data['items'][0]
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
	execute 'tabnew ' . a:data['items']
endfunction
" }}}

