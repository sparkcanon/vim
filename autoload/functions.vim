" Purpose: Utility functions for commands

" Grep {{{
" Desc: Perform the search in a sub-shell
function! functions#grep(args) abort
	let args = split(a:args, ' ')
	return system(join([&grepprg, shellescape(args[0]), len(args) > 1 ? join(args[1:-1], ' ') : ''], ' '))
endfunction
" }}}

" Visual {{{
" Desc: Get visual section
function! functions#getVisualSelection() abort
	let l=getline("'<")
	let [line1,col1] = getpos("'<")[1:2]
	let [line2,col2] = getpos("'>")[1:2]
	return l[col1 - 1: col2 - 1]
endfunction
" }}}

" Abbrs {{{
" Desc: Functions to create abbrs
" Params: from - { string } - short custom command
" Params: to - { string } - Actual command to map to
function! functions#setupCommandAbbrs(from, to) abort
	exec 'cnoreabbrev <expr> '.a:from
				\ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
				\ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
" }}}

" Git stash {{{
" Desc: Show stash list
function! functions#getGitStash() abort
	let stashList = systemlist('git stash list')
	call setqflist([], ' ', {'lines': systemlist('git stash list'), 'title': 'Stash list'}) 
				\| copen
endfunction
" }}}

" Jest {{{
" TODO: Resolve root automatically
function! functions#jestRunForSingleFile() abort
	execute 'vert terminal ./web/node_modules/.bin/jest --watch '
endfunction
" }}}

" Make {{{
" Desc: Run make on all loaded browsers
" TODO: Check if buffers are laoded
function! functions#massMake() abort
	let buffers = []
	for number in range(bufnr('$'))
		call add(buffers, bufname(number))
	endfor
	execute 'Make! ' .. join(buffers, ' ')
endfunction
" }}}

" isProject {{{
" Desc: Check if the given project matches the directory we are in
" Params: match - { string } - match to
function! functions#isProject(match) abort
	if fnamemodify(getcwd(), ":p:h:t") == a:match
		return 1
	else
		return 0
	endif
endfunction
" }}}
