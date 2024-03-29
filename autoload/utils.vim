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

  " Fold
  set foldmethod=syntax "syntax highlighting items specify folds
  set foldlevel=50
  set foldlevelstart=50

	" Console log command
	command! -nargs=0 Log execute "normal oconsole.log('".expand('<cword>')
				\ . "====> ', ".expand('<cword>').")"

	" Add import statement
	command! -nargs=0 ImportJs execute "normal ggOimport { ".expand('<cword>')." } from '';"
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

" Desc: Set path {{{
function! utils#SetPath() abort
	setglobal path-=/usr/include
	let l:vimPath = 'after/**,' .
				\ 'autoload/**,' .
				\ 'plugin/**,'
	let l:jsPath = "src/**," .
				\ "packages/aphrodite-uk/src/**,packages/aphrodite-de/src/**," .
				\ "packages/aphrodite-uk/,packages/aphrodite-de/," .
				\ "packages/," .
				\ "components/**," .
				\ "components/," .
				\ "css/**," .
				\ "e2e/**," .
				\ "stories/**,"
	return &path . l:vimPath . l:jsPath
endfunction
" }}}
