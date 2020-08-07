" Purpose: Utility functions for commands
" Author: Pratik Borde

" Section: Perform the search {{{
" Source: https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3#gistcomment-3114427
function! utils#grep(...) abort
	return system(join(extend([&grepprg], a:000), ' '))
endfunction
" }}}

" Section: Get visual section {{{
function! utils#getVisualSelection() abort
	let l:l=getline("'<")
	let [line1,col1] = getpos("'<")[1:2]
	let [line2,col2] = getpos("'>")[1:2]
	return l:l[col1 - 1: col2 - 1]
endfunction
" }}}

" Section: Functions to create abbrs {{{
" Params: from - { string } - short custom command
" Params: to - { string } - Actual command to map to
function! utils#setupCommandAbbrs(from, to) abort
	exec 'cnoreabbrev <expr> '.a:from
				\ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
				\ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
" }}}

" Section: Loc list error count {{{
function! utils#locListErrorCount() abort
	let l:locList = len(getloclist(winnr())) == 0 ? '' : 'LE: ' . len(getloclist(winnr())) . ' '
	let l:qfList = len(getqflist()) == 0 ? '' : 'QE: ' . len(getqflist())
	let l:status = l:locList . l:qfList
	return l:status
endfunction
" }}}

" Section: Long fnames in statusline {{{
function! utils#ShortenFname() abort
	let l:fname = expand("%f")
	let l:fnameList = l:fname->split('/')->len() > 4
	return l:fnameList ? pathshorten(fname) : l:fname
endfunction
" }}}

" Section: Ctags job {{{
function! utils#RunCtags() abort
	if finddir('.git', '.;') == ".git"
		let l:gen_ctags = 'fd tags.lock . --change-older-than 2min -x rm {} tags \;
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

" vim:foldmethod=marker
