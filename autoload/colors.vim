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

" Desc: extract colors {{{
function! s:extract(hi, type) abort
	let l:hi = execute('hi ' . a:hi)
	return matchstr(l:hi, 'gui' . a:type . '=\zs#[a-zA-Z0-9]\{,6}')
endfunction
" }}}

" Desc: insert in colors list {{{
function! s:KeyValue(key,val)
	call insert(s:colors, 'color' . a:key . ' ' . a:val)
endfunction
" }}}

" Desc: Write to kitty file {{{
function colors#Kitty() abort
	exe 'source $MYVIMRC'
	let s:colors = []
	let s:normalfg = s:extract('Normal', 'fg')
	let s:normalbg = s:extract('Normal', 'bg')
	let s:visualfg = s:extract('Visual', 'fg')
	let s:visualbg = s:extract('Visual', 'bg')
	let s:cursorfg = s:extract('Cursor', 'fg')
	let s:cursorbg = s:extract('Cursor', 'bg')

	call insert(s:colors, 'background ' . s:normalbg)
	call insert(s:colors, 'foreground ' . s:normalfg)
	call insert(s:colors, 'cursor ' . s:cursorbg)
	call insert(s:colors, 'cursor_text_color ' . s:cursorfg)
	call insert(s:colors, 'selection_background ' . s:visualbg)
	call insert(s:colors, 'selection_foreground ' . s:visualfg)

	let s:term_colors = eval('g:terminal_ansi_colors')
	call map(s:term_colors, function('s:KeyValue'))
	call writefile(reverse(s:colors), '/Users/praborde/.config/kitty/__autogen_colorscheme__.conf')
endfunction
" }}}

" vim:foldmethod=marker
