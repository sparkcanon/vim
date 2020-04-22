" Desc: Set formatprg & formatexpr {{{
function! format_utils#setFormatPrg() abort
	let l:findNode = findfile('prettier', 'node_modules/.bin/')
	let l:ext = ' --config-precedence prefer-file %'
	if l:findNode == 'node_modules/.bin/prettier'
		let &formatprg = l:findNode . l:ext
		let &formatexpr = ''
	elseif executable('prettier')
		let &formatprg = 'prettier' . l:ext
		let &formatexpr = ''
	endif
endfunction
" }}}

