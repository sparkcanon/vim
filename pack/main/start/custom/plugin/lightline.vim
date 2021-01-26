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
			\ 'component': {
				\ 'lineinfo': '%3l:%-2v%<',
			\ },
			\ }
