" Desc: Set formatprg & formatexpr {{{
function! format_utils#setFormatPrg() abort
	if findfile('prettier', 'node_modules/.bin/') == 'node_modules/.bin/prettier'
		let l:prettierPath = 'node_modules/.bin/prettier'
		let &l:formatprg = l:prettierPath . ' --stdin-filepath %'
		let &l:formatexpr = ''
	elseif executable('prettier')
		let l:prettierPath = 'prettier'
		let &l:formatprg = l:prettierPath . ' --stdin-filepath %'
		let &l:formatexpr = ''
	endif
endfunction
" }}}

