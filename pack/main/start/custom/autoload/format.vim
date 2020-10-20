" Purpose: Format prg

" Desc: Set format options {{{
function! format#formatprg() abort

	if findfile('prettier', 'node_modules/.bin/') == 'node_modules/.bin/prettier'
		let &l:formatprg = 'npx prettier --stdin-filepath %'
	elseif executable('prettier')
		let &l:formatprg = 'prettier --stdin-filepath %'
	endif

	let &l:formatexpr=""
endfunction
" }}}

" Desc: Format buffer and restore view {{{
function! format#buffer() abort
	let view = winsaveview()
	normal gggqG
	call winrestview(view)
endfunction
" }}}
