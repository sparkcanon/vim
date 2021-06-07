let g:lightline = {
			\ 'colorscheme': 'nord',
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
					\   'left': [ [ 'mode', 'paste' ],
					\   					[ 'gitbranch' ],
					\             [ 'filename', 'cocstatus', 'readonly', 'modified' ] ]
					\ },
					\ 'component_function': {
						\   'cocstatus': 'coc#status',
						\   'gitbranch': 'FugitiveHead'
						\ },
						\ }
