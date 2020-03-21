" Make buffer transparent
function! colors#modifyBufferColors() abort
	highlight! Normal ctermbg=NONE
	highlight! EndOfBuffer ctermbg=NONE ctermfg=241
	highlight! VertSplit ctermbg=NONE
	highlight! signcolumn ctermbg=NONE
endfunction

" Signify color mods
function! colors#modifySignifyColors() abort
	" Green
	highlight SignifySignAdd ctermfg=48
	" Red
	highlight SignifySignDelete ctermfg=196
	" Yellow
	highlight SignifySignChange ctermfg=226
endfunction
