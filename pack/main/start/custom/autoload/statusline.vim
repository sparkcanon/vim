" Purpose: Statusline

" Desc: displays a flag if there are unseen quickfix errors {{{
function! statusline#quickfix() abort
	return getqflist()->len() > 0 ? '[Q]' : ''
endfunction
" }}}

" Desc: displays a flag if there are unseen loclist errors {{{
function! statusline#loclist() abort
	return getloclist(winnr())->len() > 0 ? '[L]' : ''
endfunction
" }}}

" Desc: displays a flag if there is a currently running background job {{{
function! statusline#bg() abort
	return exists('g:asyncdo') ? '[bg]' : ''
endfunction
" }}}
