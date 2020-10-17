" Purpose: Format prg

" Desc: Set format options {{{
function! format#formatprg() abort

	if findfile('prettier', 'node_modules/.bin/') == 'node_modules/.bin/prettier'
		let l:fmt_prettier = 'npx prettier'
	elseif executable('prettier')
		let l:fmt_prettier = 'prettier'
	endif

	let &l:formatprg = l:fmt_prettier . " --stdin-filepath %"
	setlocal formatexpr=
endfunction
" }}}

" Desc: Format buffer and restore view {{{
function! format#buffer() abort
  let view = winsaveview()
  normal gggqG
  call winrestview(view)
endfunction
" }}}
