" Purpose: Modify vim colors here

" Desc: normal, EOB, split, sign column colors {{{
function! colors#modifyBufferColors() abort
	" Editor colors
	highlight! VertSplit cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
	highlight! GitGutterAdd guifg=#538448 guibg=NONE
	highlight! GitGutterChange guifg=#486484 guibg=NONE
	highlight! GitGutterDelete guifg=#775D79 guibg=NONE

	" Hint: This below makes the background transparent
	" highlight! Normal ctermbg=NONE guibg=NONE
	" hi Normal ctermbg=233 ctermfg=250 cterm=NONE guibg=#262626 guifg=#bcbcbc gui=NONE
endfunction
" }}}
