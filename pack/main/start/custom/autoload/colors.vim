" Purpose: Modify vim colors here

" Desc: normal, EOB, split, sign column colors {{{
function! colors#modifyBufferColors() abort
	" Editor colors
	highlight! VertSplit cterm=NONE ctermbg=NONE gui=NONE guibg=NONE

	" `LspErrorHighlight`, `LspWarningHighlight`, `LspInformationHighlight` and
	" `LspHintHighlight` highlight groups.

	" Hint: This below makes the background transparent
	" highlight! Normal ctermbg=NONE guibg=NONE
endfunction
" }}}
