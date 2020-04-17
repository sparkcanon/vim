" Desc: Set formatprg & formatexpr {{{
function! format_utils#setFormatPrg() abort
	let l:findNode = findfile('prettier', 'node_modules/.bin/')
	if l:findNode == 'node_modules/.bin/prettier'
		let &formatprg = l:findNode . ' --stdin-filepath %'
		let &formatexpr = ''
	elseif executable('prettier')
		let &formatprg = 'prettier --stdin-filepath %'
		let &formatexpr = ''
	endif
endfunction
" }}}

