" Purpose: Modify vim colors here

" Desc: normal, EOB, split, sign column colors
function! colors#modifyBufferColors() abort
	highlight! Normal ctermbg=NONE
	highlight! EndOfBuffer ctermbg=NONE ctermfg=241
	highlight! VertSplit cterm=NONE ctermbg=NONE
	highlight! signcolumn ctermbg=NONE
endfunction
