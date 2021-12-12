" Purpose: Modify vim colors here

" Desc: normal, EOB, split, sign column colors {{{
function! colors#modifyBufferColors() abort
	" Editor colors
	highlight! VertSplit cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
	highlight! DiffAdd guifg=#87af87 guibg=NONE
	highlight! DiffDelete guifg=#444444 guibg=NONE

	" Hint: This below makes the background transparent
	" highlight! Normal ctermbg=NONE guibg=NONE
	" hi Normal ctermbg=233 ctermfg=250 cterm=NONE guibg=#262626 guifg=#bcbcbc gui=NONE
endfunction
" }}}
