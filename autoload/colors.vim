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
	highlight! lscDiagnosticError guifg=#af5f5f cterm=underline
	highlight! lscDiagnosticWarning guifg=#af5f5f cterm=underline
	highlight! lscDiagnosticInfo guifg=#585858 cterm=underline
	highlight! lscDiagnosticHint guifg=#585858 cterm=underline
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

	if exists('g:terminal_ansi_colors')
		let s:term_colors = eval('g:terminal_ansi_colors')
		call map(s:term_colors, function('s:KeyValue'))
	endif
	call writefile(reverse(s:colors), '/Users/praborde/.config/kitty/__autogen_colorscheme__.conf')
endfunction

" Desc: extract colors
function! s:extract(hi, type) abort
	let l:hi = execute('hi ' . a:hi)
	return matchstr(l:hi, 'gui' . a:type . '=\zs#[a-zA-Z0-9]\{,6}')
endfunction

" Desc: insert in colors list
function! s:KeyValue(key,val)
	call insert(s:colors, 'color' . a:key . ' ' . a:val)
endfunction
" }}}

" Desc: Color picker {{{
" Desc: init
function! colors#picker() abort
  let l:initial_colorscheme = get(g:, 'colors_name', 'default')
  call quickpick#open({
    \ 'items': getcompletion('', 'color'),
    \ 'on_accept': function('s:on_accept'),
    \ 'on_selection': function('s:on_selection', [l:initial_colorscheme]),
    \ 'on_cancel': function('s:on_cancel', [l:initial_colorscheme]),
    \ })
endfunction

" Desc: On color picker accept selection
function! s:on_accept(data, ...) abort
  call quickpick#close()
  execute 'colorscheme ' . a:data['items'][0]
endfunction

" Desc: On color picker selection
function! s:on_selection(initial_colorscheme, data, ...) abort
  if empty(a:data['items'])
    execute 'colorscheme ' . a:initial_colorscheme
  else
    execute 'colorscheme ' . a:data['items'][0]
  endif
endfunction

" Desc: On color picker cancel
function! s:on_cancel(initial_colorscheme, data, ...) abort
  if !empty(a:initial_colorscheme)
    execute 'colorscheme ' . a:initial_colorscheme
  endif
endfunction
" }}}

