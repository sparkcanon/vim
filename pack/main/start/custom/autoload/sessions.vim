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
	call fzf#run({
				\  'source': 'fd .',
				\  'sink': 'so',
				\  'dir': '~/.vim/tmp/dir_session',
				\  'window': { 'width': 1, 'height': 0.3, 'yoffset': 1 } })
endfunction
" }}}

