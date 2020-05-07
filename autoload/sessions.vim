" Purpose: Session based logic

" Desc: Save on VIMLEAVE
function! sessions#sessionSave() abort
	let l:findGit = finddir('.git', '.;')
	if l:findGit == ".git"
		let l:root = substitute(fnamemodify(getcwd(0), ':t'), '^\.', '', '')
		execute 'mks! $HOME/.vim/tmp/dir_session/' . l:root . '.vim'
	endif
endfunction

" Desc: Complete path for save command
" TODO: Path autocomplete using a:A
function! sessions#sessionCompletePath(A,L,P) abort
	let l:pathList = globpath('$HOME/.vim/tmp/dir_session/', '*.vim')
	let l:fname = substitute(l:pathList, '/Users/praborde/.vim/tmp/dir_session/', '', 'g')
	return split(l:fname, '\n')
endfunction
