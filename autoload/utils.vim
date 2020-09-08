" Purpose: Utility functions for commands
" Author: Pratik Borde

" Desc: Get visual section {{{
function! utils#getVisualSelection() abort
	let l:l=getline("'<")
	let [line1,col1] = getpos("'<")[1:2]
	let [line2,col2] = getpos("'>")[1:2]
	return l:l[col1 - 1: col2 - 1]
endfunction
" }}}

" Desc: Functions to create abbrs {{{
" Params: from - { string } - short custom command
" Params: to - { string } - Actual command to map to
function! utils#setupCommandAbbrs(from, to) abort
	exec 'cnoreabbrev <expr> '.a:from
				\ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
				\ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
" }}}

" Desc: Ctags job {{{
function! utils#RunCtags() abort
	if finddir('.git', '.;') == ".git"
		let l:gen_ctags = 'fd tags.lock . --change-older-than 2min -d 1 --no-ignore -x rm {} tags \;
					\ && [ ! -f tags.lock ] && touch tags.lock
					\ && ctags .
					\ && rm -rf tags.lock'
		call job_start([&shell, &shellcmdflag, l:gen_ctags], {
					\ "in_io": "null", 
					\ "out_io": "null", 
					\	"err_io": "null"
					\ })
	endif
endfunction
" }}}

" Desc: Current project check {{{
function! utils#isProject(match) abort
	let l:cmd = [ 'git', 'rev-parse', '--show-toplevel' ]
	let l:opt = { 'callback': 'GitHandler' }
	let l:gitJob = job_start(l:cmd, l:opt)
	let l:git_match = ''

	function! GitHandler(channel, msg) abort
		if !empty(a:msg) && a:msg !~ 'fatal'
			let l:git_match = a:msg
		endif
	endfunction

	if fnamemodify(l:git_match, ':p:h:t') == a:match
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
    autocmd MkdirAutocmd BufWritePre <buffer>
      \ call mkdir(b:path, 'p')
      \ | unlet b:path
      \ | autocmd! MkdirAutocmd  * <buffer>
  endif
endfunction
" }}}

" vim:foldmethod=marker
