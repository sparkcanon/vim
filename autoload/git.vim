" Purpose: Git stash

" Desc: Actions {{{
function! s:GitStashActions(e) abort
	let cmd = get({'ctrl-s': '!git stash show', 'ctrl-d': '!git stash drop', 'ctrl-a': '!git stash apply'}, a:e)
	execute cmd matchstr(a:e, '\d\+')
endfunction
" }}}

" Desc: Runner {{{
function! git#stash() abort
	call fzf#run({
				\ 'source': 'git stash list',
				\ 'sink': function('s:GitStashActions'),
				\ 'options': '--expect=ctrl-s,ctrl-d,ctrl-a',
				\ 'down': '35%'
				\ })
endfunction
" }}}

" vim:foldmethod=marker
