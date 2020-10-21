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
function! s:sessionActions(e) abort
	let l:cmd = get({'enter': 'source', 'ctrl-d': '!rm'}, a:e[0])
	execute l:cmd '~/.vim/tmp/dir_session/' . a:e[1]
endfunction

function! sessions#picker() abort
	call fzf#run({
				\  'source': 'fd . --base-directory ~/.vim/tmp/dir_session/',
				\  'sink*': function('s:sessionActions'),
				\  'options': '--expect=enter,ctrl-d',
				\  'window': { 'width': 1, 'height': 0.3, 'yoffset': 1 } })
endfunction
" }}}

