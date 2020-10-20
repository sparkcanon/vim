" Purpose: Session based logic

" Desc: Save session {{{
function! sessions#sessionSave() abort
	if finddir('.git', '.;') == ".git" || filereadable('.gitignore')
		let l:root = substitute(fnamemodify(getcwd(0), ':t'), '^\.', '', '')
		execute 'mks! ' . $HOME . '/.vim/tmp/dir_session/' . l:root . '.vim'
	endif
endfunction
" }}}

" Desc: Picker {{{
function! sessions#picker() abort
	let l:items = systemlist('fd . --base-directory ' . $HOME . '/.vim/tmp/dir_session/')
	call quickpick#open({
				\ 'items': l:items,
				\ 'on_accept': function('s:on_accept'),
				\ })
endfunction

" Desc: On color picker accept selection
function! s:on_accept(data, ...) abort
	call quickpick#close()
	execute 'source ' . $HOME . '/.vim/tmp/dir_session/' . a:data['items'][0]
endfunction
" }}}

