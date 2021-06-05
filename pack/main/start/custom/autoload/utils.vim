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
	" inoremap {<CR> {<CR>}<esc>O
	" inoremap (<CR> (<CR>)<esc>O
	" inoremap [<CR> [<CR>]<esc>O
	" iabbrev <buffer> scfu const  = () => {}<esc>2F=2h
	" iabbrev <buffer> sif if () {<CR><CR>}<Up>
	" iabbrev <buffer> simp import {} from '';<esc>2ha
	" iabbrev <buffer> srnc import React from 'react';<CR>import { View } from 'react-native';<CR><CR>export const CustomComponent = () => {<CR>return <View></View><CR>}<esc>
	" iabbrev <buffer> srss const styles = StylesSheet.create({<CR>container: {},<CR>})<esc>

	" Commands
	" Console log command
	command! -nargs=0 Log execute "normal oconsole.log('".expand('<cword>')
				\ . "====> ', ".expand('<cword>').")"

	" Add import statement
	command! -nargs=0 ImportJs execute "normal ggOimport { ".expand('<cword>')." } from '';"
endfunction
" }}}

" Desc: Statusline {{{
function! utils#statusline_expr() abort
	let l:mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
	let l:ro  = "%{&readonly ? '[RO] ' : ''}"
	let l:ft  = "[ %{WebDevIconsGetFileTypeSymbol()} ] "
	let l:sep = ' %= '
	let l:pos = ' %-12(%l:%c%V%) '
	let l:pct = ' %P'
	let l:fn  = ' %{pathshorten(expand("%"))} '
	let l:coc = ' [ %{coc#status()} ] '

	" Fugitive
	" let l:fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"

	return ' ❮'.l:fn.l:coc.'%<'.l:mod.l:ro.l:sep.l:ft.l:pos.'%*'.l:pct.' ❯ '
endfunction
" }}}

" Desc: Open files using open {{{
" Source: https://github.com/vim/vim/issues/4738#issuecomment-714609892
function! utils#OpenURLUnderCursor() abort
	let s:uri = matchstr(getline('.'), '[a-z]*:\/\/[^ >,;()]*')
	let s:uri = shellescape(s:uri, 1)
	if s:uri != ''
		silent exec "!open '".s:uri."'"
		:redraw!
	endif
endfunction
" }}}

" Desc: diff arbitrary revisions {{{
" Source: https://gist.github.com/romainl/7198a63faffdadd741e4ae81ae6dd9e6
function! utils#Diff(spec) abort
	vertical new
	setlocal bufhidden=wipe buftype=nofile nobuflisted noswapfile
	let cmd = "++edit #"
	if len(a:spec)
		let cmd = "!git -C " . shellescape(fnamemodify(finddir('.git', '.;'), ':p:h:h')) . " show " . a:spec . ":#"
	endif
	execute "read " . cmd
	silent 0d_
	diffthis
	wincmd p
	diffthis
endfunction
" }}}
