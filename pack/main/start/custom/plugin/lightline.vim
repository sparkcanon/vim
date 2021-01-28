" Purpose: Lightline configuration

" Section: Set up {{{
let g:lightline = {
			\ 'colorscheme': 'spaceduck',
			\ 'mode_map': {
				\ 'n' : 'N',
				\ 'i' : 'I',
				\ 'R' : 'R',
				\ 'v' : 'V',
				\ 'V' : 'VL',
				\ "\<C-v>": 'VB',
				\ 'c' : 'C',
				\ 's' : 'S',
				\ 'S' : 'SL',
				\ "\<C-s>": 'SB',
				\ 't': 'T',
			\ },
			\ 'active': {
				\ 'left': [ [ 'mode', 'paste' ],
				\           [ 'IsDiff', 'readonly', 'FileNameWithIcon', 'modified' ] ],
				\ 'right': [ [ 'lineinfo' ],
				\            [ 'percent' ] ]
			\ },
			\ 'inactive': {
				\   'left': [ [ 'IsDiff', 'filename'  ] ],
				\   'right': [ [ 'lineinfo' ], [ 'percent' ] ]
			\ },
			\ 'component': {
				\ 'lineinfo': '%3l:%-2v%<',
			\ },
			\ 'component_function': {
				\ 'IsDiff': 'IsDiff',
				\ 'FileNameWithIcon': 'FileNameWithIcon'
			\ },
			\ }
" }}}

" Section: Icon {{{
function! FileNameWithIcon() abort
	return  WebDevIconsGetFileTypeSymbol() . ' ' . pathshorten(expand('%'))
endfunction
" }}}

" Section: Show diff in lightline {{{
function! IsDiff() abort
	let l:fullname = buffer_name()
	let l:diffname = ''
	if l:fullname =~? 'fugitive://.*/\.git//0/.*'
		let l:diffname = 'Index'
	elseif l:fullname =~? 'fugitive://.*/\.git//2/.*'
		let l:diffname = 'Target'
	elseif l:fullname =~? 'fugitive://.*/\.git//3/.*'
		let l:diffname = 'Merge'
	elseif l:fullname =~? 'fugitive://.*/0/.*'
		let l:diffname = 'Index'
	elseif &diff == 1
		let l:diffname = 'Working copy'
	endif
	return l:diffname
endfunction
" }}}
