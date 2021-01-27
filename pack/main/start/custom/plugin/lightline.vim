" Purpose: Lightline set up

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
				\         [ 'IsDiff', 'readonly', 'filename', 'modified' ] ]
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
			\ },
			\ }

function! IsDiff()
	let fullname = expand('%')
	let gitversion = ''
	if fullname =~? 'fugitive://.*/\.git//0/.*'
		let gitversion = 'Index'
	elseif fullname =~? 'fugitive://.*/\.git//2/.*'
		let gitversion = 'Target'
	elseif fullname =~? 'fugitive://.*/\.git//3/.*'
		let gitversion = 'Merge'
	elseif &diff == 1
		let gitversion = 'Working copy'
	endif
	return gitversion
endfunction
