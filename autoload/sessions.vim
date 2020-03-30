" Purpose: Session based logic

" Desc: Save on VIMLEAVE
function! sessions#sessionSave() abort
	let l:findGit = finddir(".git", system("git rev-parse --show-toplevel")[:-2])
	if !empty(l:findGit)
		let root = fnamemodify(fnamemodify(getcwd(0), ":t"), ":s?\.??")
		execute "mks! $HOME/.vim/tmp/dir_session/".root.".vim" | echo "Session saved as ".root.".vim"
	else
		echo "Failed: not a git repo."
	endif
endfunction

" Desc: Load saved session
function! sessions#sessionLoad(file) abort
	execute "source $HOME/.vim/tmp/dir_session/".a:file | echo "Session ".a:file." has been loaded"
endfunction

" Desc: Complete path for save command
" TODO: Path autocomplete using a:A
function! sessions#sessionCompletePath(A,L,P) abort
	let l:pathList = globpath("$HOME/.vim/tmp/dir_session/", "*.vim")
	let l:fname = substitute(l:pathList, "/Users/praborde/.vim/tmp/dir_session/", "", "g")
	return split(l:fname, "\n")
endfunction
