" Save sessions
function! sessions#sessionSave() abort
	let l:findGit = finddir('.git', system('git rev-parse --show-toplevel')[:-2])
	if !empty(l:findGit)
		let root = fnamemodify(fnamemodify(getcwd(0), ':t'), ':s?\.??')
		execute 'mks! $HOME/.vim/tmp/dir_session/'.root.'.vim' | echo 'Session saved as '.root.'.vim'
	else
		echo "Failed: not a git repo."
	endif
endfunction

" Load saved session
function! sessions#sessionLoad(file) abort
	execute 'source $HOME/.vim/tmp/dir_session/'.a:file | echo 'Session '.a:file.' has been loaded'
endfunction

" Complete path for save command
function! sessions#sessionCompletePath(A,L,P) abort
	let pathList =  globpath('$HOME/.vim/tmp/dir_session/', '*.vim', 0, 1)
	let emptyList = []
	for i in pathList
		let item = split(i, '/')[-1]
		let finalList = add(emptyList, item)
	endfor
	return finalList
endfunction
