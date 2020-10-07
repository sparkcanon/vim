" Purpose: Modify vim colors here

" Desc: normal, EOB, split, sign column colors {{{
function! colors#modifyBufferColors() abort
	" Editor colors
	highlight! EndOfBuffer ctermbg=NONE ctermfg=241 guibg=NONE
	highlight! VertSplit cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
	highlight! LineNr ctermbg=NONE guibg=NONE
	highlight! link HighlightedyankRegion Visual
	
	" Hint: This below makes the background transparent
	" highlight! Normal ctermbg=NONE guibg=NONE
	
	" Lsc colors
	highlight! lscDiagnosticError guifg=#cc517a cterm=underline
	highlight! lscDiagnosticWarning guifg=#cc517a cterm=underline
	highlight! lscDiagnosticInfo guifg=#6b7089 cterm=underline
	highlight! lscDiagnosticHint guifg=#6b7089 cterm=underline
endfunction
" }}}

" vim:foldmethod=marker
