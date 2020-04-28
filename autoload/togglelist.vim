" Purpose: Toggle qf/loc list

function! s:GetBufferList() abort
	redir =>buflist
	silent! ls!
	redir END
	return buflist
endfunction

function! togglelist#ToggleList(bufname, pfx) abort
	let l:buflist = s:GetBufferList()

	for bufnum in map(filter(split(l:buflist, '\n'), 'v:val =~ "' . a:bufname .
				\ '"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
		if bufwinnr(bufnum) != -1
			exec(a:pfx . 'close')
			return
		endif
	endfor

	if a:pfx == 'l' && len(getloclist(0)) == 0
		echohl ErrorMsg
		echo "Location List is Empty"
		return
	endif

	let l:winnr = winnr()
	exec(a:pfx . 'open')

	if winnr() != l:winnr
		wincmd p
	endif
endfunction
