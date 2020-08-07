" Purpose: Utils for includeexpr function PathSubstitue

" Desc: Build string for relative paths {{{
" Params: fname - v:fname comes through includeexpr, PathSubstitue
" Params: modifier - stabalize the dirsPath
function! path_utils#Build_glob_string_from_relative_fname(fname, modifier)
	" build string to pass to glob()
	"     expected output:
	"         src/foo/bar{/bar,/index,*}.{js,ts}
	"     covered cases:
	"         ./foo/bar => ./foo/bar.js
	"         ./foo/bar => ./foo/bar/bar.js
	"         ./foo/bar => ./foo/bar/index.js
	"         ../../foo/bar => ../../foo/bar.js
	"         ../../foo/bar => ../../foo/bar/bar.js
	"         ../../foo/bar => ../../foo/bar/index.js
	"     components:
	"         root: expanded from './' or '../../' and '%'
	"         dirsPath: a:fname without './' or '../../'
	"         radical: last part of a:fname
	"         suffixes: expanded from &suffixes
	return ''
				\ . expand('%:.:h' . a:modifier) . '/'
				\ . matchstr(a:fname, '\(\(\.\)\+/\)\+\zs.*')
endfunction
" }}}

" Desc: Build string for aliased paths {{{
" Params: fname - v:fname comes through includeexpr, PathSubstitue
function! path_utils#Build_glob_string_from_aliased_fname(fname)
	return ''
				\ . a:fname
				\ . '{/' . split(a:fname, '/')[-1] . ',/index,}'
				\ . '.{' . substitute(&suffixesadd, '\.', '', 'g') . '}'
endfunction
" }}}

" Desc: Current project check {{{
function! path_utils#isProject(match) abort
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

" vim:foldmethod=marker
