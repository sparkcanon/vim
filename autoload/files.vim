" Purpose: Files

" Section: Files picker {{{
function! files#picker(A,L,P) abort
	let l:cmd = 'fd . ' .
				\ '-H ' .
				\ '--no-ignore ' .
				\ '-t f ' .
				\ '-E bin/ ' .
				\ '-E eslint/ ' .
				\ '-E __mocks__/ ' .
				\ '-E tests_utils/ ' .
				\ '-E docs/ ' .
				\ '-E backstop_data/ ' .
				\ '-E __snapshots__/ ' .
				\ '-E node_modules/ ' .
				\ '-E .git/ ' .
				\ '-E web/assets/ ' .
				\ '-E web/public/ ' .
				\ '-E web/.cache-loader/ ' .
				\ '-E .github/ ' .
				\ '-E dist/ ' .
				\ '-E tmp/ ' .
				\ '-E ".gitattributes" ' .
				\ '-E ".gitkeep" ' .
				\ '-E "*.req" ' .
				\ '-E ".DS_Store" ' .
				\ '-E "*.res" ' .
				\ '-E "*.jpg" ' .
				\ '-E "*.png" ' .
				\ '-E "*.svg" ' .
				\ '-E "coverage/"'

	let l:items = l:cmd->systemlist()
	if a:A->len() > 0
		return l:items->matchfuzzy(a:A)
	else
		return l:items
	endif
endfunction
" }}}

" Section: Files runner {{{
function! files#runner(args) abort
	exe 'e ' .. a:args
endfunction
" }}}

" Section: Fzf {{{
function! files#fzf() abort
	let l:tempname = tempname()
	" fzf | awk '{ print $1":1:0" }' > file
	execute 'silent !fzf --multi ' . '| awk ''{ print $1":1:0" }'' > ' . fnameescape(l:tempname)
	try
		execute 'cfile ' . l:tempname
		redraw!
	finally
		call delete(l:tempname)
	endtry
endfunction
" }}}

" Section: Rg {{{
function! files#rg(args) abort
	let l:tempname = tempname()
	let l:pattern = '.'
	if len(a:args) > 0
		let l:pattern = a:args
	endif
	" rg --vimgrep <pattern> | fzf -m > file
	execute 'silent !rg --vimgrep ''' . l:pattern . ''' | fzf -m > ' . fnameescape(l:tempname)
	try
		execute 'cfile ' . l:tempname
		redraw!
	finally
		call delete(l:tempname)
	endtry
endfunction
" }}}
