" Purpose: Utility functions for commands

" Grep {{{
" Desc: Perform the search in a sub-shell
function! utils#grep(args) abort
	let l:args = split(a:args, ' ')
	return system(join([&grepprg, shellescape(l:args[0]), len(l:args) > 1 ? join(l:args[1:-1], ' ') : ''], ' '))
endfunction
" }}}

" Visual {{{
" Desc: Get visual section
function! utils#getVisualSelection() abort
	let l:l=getline("'<")
	let [line1,col1] = getpos("'<")[1:2]
	let [line2,col2] = getpos("'>")[1:2]
	return l:l[col1 - 1: col2 - 1]
endfunction
" }}}

" Abbrs {{{
" Desc: Functions to create abbrs
" Params: from - { string } - short custom command
" Params: to - { string } - Actual command to map to
function! utils#setupCommandAbbrs(from, to) abort
	exec 'cnoreabbrev <expr> '.a:from
				\ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
				\ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
" }}}

" Jest {{{
" TODO: Resolve root automatically
function! utils#jestRunForSingleFile() abort
	execute 'vert terminal ./web/node_modules/.bin/jest --watch '
endfunction
" }}}

" Make {{{
" Desc: Run make on all loaded browsers
" TODO: Check if buffers are laoded
function! utils#massMake() abort
	let buffers = []
	for number in range(bufnr('$'))
		call add(buffers, bufname(number))
	endfor
	execute 'Make! ' .. join(buffers, ' ')
endfunction
" }}}

" Loc list error count {{{
function! utils#locListErrorCount() abort
	let l:locList = len(getloclist(winnr())) == 0 ? '' : 'LE: ' . len(getloclist(winnr()))
	let l:qfList = len(getqflist()) == 0 ? '' : 'QE: ' . len(getqflist())
	let l:status = l:locList . l:qfList
	return l:status
endfunction
" }}}
