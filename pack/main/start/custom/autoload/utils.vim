" Purpose: Utility functions for commands

" Desc: Functions to create abbrs {{{
" Params: from - { string } - short custom command
" Params: to - { string } - Actual command to map to
function! utils#setupCommandAbbrs(from, to) abort
	exec 'cnoreabbrev <expr> '.a:from
				\ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
				\ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
" }}}

" Desc: Current project check {{{
function! utils#isProject(match) abort
	if system('git rev-parse --show-toplevel')[:-2]->fnamemodify(':t') == a:match
		return 1
	else
		return 0
	endif
endfunction
" }}}

" Desc: Create new dir if it doesnt exist {{{
function! utils#mkdir(path) abort
	if !isdirectory(a:path)
		let b:path = a:path
		autocmd GeneralAutocmds BufWritePre <buffer>
					\ call mkdir(b:path, 'p')
					\ | unlet b:path
					\ | autocmd! GeneralAutocmds  * <buffer>
	endif
endfunction
" }}}

" Desc: Js/ts mappings {{{
function! utils#js_mappings() abort
	" Mappings
	" Template literals
	iabbrev <buffer> s{ {}
	iabbrev <buffer> s( ()
	iabbrev <buffer> s[ []
	iabbrev <buffer> /* /*<CR><CR>/<esc>kA
	iabbrev <buffer> scfu const  = () => {}<esc>2F=2h
	iabbrev <buffer> sif if () {<CR><CR>}<Up>
	iabbrev <buffer> simp import {} from '';<esc>2ha

	" Commands
	" Console log command
	command! -nargs=0 Log execute "normal oconsole.log('".expand('<cword>')
				\ . "====> ', ".expand('<cword>').")"

	" Add import statement
	command! -nargs=0 ImportJs execute "normal ggOimport { ".expand('<cword>')." } from '';"
endfunction
" }}}

" Desc: displays a flag if there is a currently running background job {{{
function! utils#bg() abort
	return exists('g:asyncdo') ? '[bg]' : ''
endfunction
" }}}
