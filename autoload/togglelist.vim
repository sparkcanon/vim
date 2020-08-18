" Purpose: Toggle qf/loc list

" Desc: get list of buffers {{{
function! s:GetBufferList() abort
	redir =>buflist
	silent! ls!
	redir END
	return buflist
endfunction
" }}}

" Desc: toggle qf/loc list {{{
function! togglelist#ToggleList(bufname, pfx) abort
	let l:buflist = s:GetBufferList()

	for bufnum in l:buflist
				\->split('\n')
				\->filter('v:val =~ "' . a:bufname . '"')
				\->map('str2nr(matchstr(v:val, "\\d\\+"))')
		if bufnum->bufwinnr() != -1
			exec(a:pfx . 'close')
			return
		endif
	endfor

	if a:pfx == 'l' && getloclist(0)->len() == 0
		echohl ErrorMsg
		echo "Location List is Empty"
		return
	endif

	let l:winnr = winnr()
	exec(a:pfx . 'window')

	if winnr() != l:winnr
		wincmd p
	endif
endfunction
" }}}

" vim:foldmethod=marker
