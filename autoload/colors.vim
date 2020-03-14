" Make buffer transparent
function! colors#modifyBufferColors() abort
	highlight! Normal ctermbg=NONE
	highlight! EndOfBuffer ctermbg=NONE ctermfg=241
	highlight! VertSplit ctermbg=NONE
endfunction

" Lsc signs color mods
function! colors#modifylscColors() abort
	" Red
	highlight lscDiagnosticError ctermfg=196 cterm=bold
	" Orange
	highlight lscDiagnosticWarning ctermfg=202 cterm=bold
	" Green
	highlight lscDiagnosticInfo ctermfg=48 cterm=bold
	" Yellow
	highlight lscDiagnosticHint ctermfg=226 cterm=bold
	" Grey
	highlight lscReference ctermbg=236 ctermfg=white
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
