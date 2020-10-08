" Purpose: Git

" Desc: Stash actions {{{
function! s:GitStashActions(e) abort
	let cmd = get({'ctrl-s': '!git stash show', 'ctrl-d': '!git stash drop', 'ctrl-a': '!git stash apply'}, a:e)
	execute cmd matchstr(a:e, '\d\+')
endfunction
" }}}

" Desc: Stash runner {{{
function! git#stash() abort
	call fzf#run({
				\ 'source': 'git stash list',
				\ 'sink': function('s:GitStashActions'),
				\ 'options': '--expect=ctrl-s,ctrl-d,ctrl-a',
				\ 'tmux': '-d20%' })
endfunction
" }}}

" Desc: Stash actions {{{
function! s:GitCheckoutAction(e) abort
	execute '!git checkout ' . trim(a:e)
endfunction
" }}}

" Desc: Checkout runner {{{
function! git#checkout() abort
	call fzf#run({
				\ 'source': 'git branch --all | grep -v HEAD',
				\ 'sink': function('s:GitCheckoutAction'),
				\ 'tmux': '-d20%' })
endfunction
" }}}

" vim:foldmethod=marker
