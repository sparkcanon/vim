" Purpose: Utils for includeexpr function PathSubstitue

" Desc: Build string for relative paths {{{
" Params: fname - v:fname comes through includeexpr, PathSubstitue
" Params: modifier - stabalize the path
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
	"         path: a:fname without './' or '../../'
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

" Desc: Fd job to set path {{{
function! path_utils#setProjectPath() abort
	if path_utils#isProject('lego-web')
		let l:depth = '--exact-depth'
	else
		let l:depth = '--max-depth'
	endif
	let l:lego_cmd = [ 'fd', '.',
				\ l:depth, '2',
				\ '-t', 'd',
				\ '-E', 'test/',
				\ '-E', 'bin/',
				\ '-E', 'eslint/',
				\ '-E', '__mocks__/',
				\ '-E', 'tests_utils/',
				\ '-E', 'bin/',
				\ '-E', 'eslint/',
				\ '-E', 'docs/',
				\ '-E', 'backstop_data/',
				\ ]
	let l:opt = { 'callback': 'FdPathHandler' }
	let l:fdJob = job_start(l:lego_cmd, l:opt)
	let s:path = []

	function! FdPathHandler(channel, msg) abort
		if !empty(a:msg)
			let l:rawPath = insert(s:path, a:msg . '/**')
			let &l:path = l:rawPath->sort()->uniq()->join(',')
		endif
	endfunction

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
