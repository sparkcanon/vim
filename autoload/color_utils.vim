" Purpose: Modify vim colors here

" Desc: normal, EOB, split, sign column colors
function! color_utils#modifyBufferColors() abort
	highlight! EndOfBuffer ctermbg=NONE ctermfg=241 guibg=NONE
	highlight! VertSplit cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
	highlight! LineNr ctermbg=NONE guibg=NONE
	highlight! link HighlightedyankRegion Visual
	
	" Hint: This below makes the background transparent
	" highlight! Normal ctermbg=NONE guibg=NONE
endfunction
