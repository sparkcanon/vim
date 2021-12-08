" Purpose: Git

" Desc: Stash actions {{{
function! git#stash_runner(arg) abort
	let l:input = input('a: Apply stash, d: Drop stash, s: Show stash: ')
	if l:input == "a"
		exe 'term Git stash apply ' . matchstr(a:arg, '\d\+')
	elseif l:input == "s"
		exe 'term Git stash show ' . matchstr(a:arg, '\d\+')
	elseif l:input == 'd'
		exe 'term Git stash drop ' . matchstr(a:arg, '\d\+')
	endif
endfunction

" Desc: Stash runner
function! git#stash_picker(A,L,P) abort
	let l:items = systemlist('git stash list')
	if a:A->len() > 0
		return l:items->matchfuzzy(a:A)
	else
		return l:items
	endif
endfunction
" }}}

" Desc: Checkout {{{
" TODO: Check for current branch using *
function! git#checkout_runner(arg) abort
	execute 'term git checkout ' . a:arg->substitute('^*', '', '')->trim()
endfunction

function! git#checkout_picker(A,L,P) abort
	let l:raw_items = systemlist('git branch --all | grep -v HEAD')
	let l:items = []
	for l:branches in l:raw_items
		call insert(l:items, trim(l:branches))
	endfor
	if a:A->len() > 0
		return l:items->matchfuzzy(a:A)
	else
		return l:items
	endif
endfunction
" }}}
