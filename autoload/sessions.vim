" Purpose: Session based logic

" Desc: Save session {{{
function! sessions#sessionSave() abort
	if finddir('.git', '.;') == ".git"
		let l:root = substitute(fnamemodify(getcwd(0), ':t'), '^\.', '', '')
		execute 'mks! $HOME/.vim/tmp/dir_session/' . l:root . '.vim'
	endif
endfunction
" }}}

" vim:foldmethod=marker
