" Purpose: Session

" Desc: Save session {{{
function! sessions#sessionSave() abort
	if finddir('.git', '.;') == ".git" || filereadable('.gitignore')
		let l:root = getcwd(0)->fnamemodify(':t')->substitute('^\.', '', '')
		if !isdirectory(expand($HOME . '/.vim/tmp/dir_session'))
			call mkdir($HOME . '/.vim/tmp/dir_session', 'p')
			execute 'mks! ' . $HOME . '/.vim/tmp/dir_session/' . l:root . '.vim'
		endif
		execute 'mks! ' . $HOME . '/.vim/tmp/dir_session/' . l:root . '.vim'
	endif
endfunction
" }}}

" Desc: complete {{{
function! sessions#complete(A,L,P) abort
	if !isdirectory(expand($HOME . '/.vim/tmp/dir_session'))
		call mkdir($HOME . '/.vim/tmp/dir_session', 'p')
	endif
	let l:items = systemlist('fd . --base-directory $HOME/.vim/tmp/dir_session/')
	if a:A->len() > 0
		return l:items->matchfuzzy(a:A)
	else
		return l:items
	endif
endfunction
" }}}
