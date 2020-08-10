" Purpose: General purpose path setup using fd for various projects
" Author: Pratik Borde

" Desc: Fd job to set dirsPath {{{
function! path_job#setProjectPath() abort
	if utils#isProject('lego-web')
		let l:depth = '--exact-depth'
	else
		let l:depth = '--max-depth'
	endif

	let l:cmd = [ 'fd', '.',
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
				\ '-E', 'pack/'
				\ ]
	let l:opt = { 'close_cb': 'FdDirHandler' }
	let l:jobStart = job_start(l:cmd, l:opt)
endfunction
" }}}

" Desc: Handle paths from fd job {{{
let s:fdPaths = []
function! FdDirHandler(channel) abort
	while ch_status(a:channel, {'part': 'out'}) == 'buffered'
		call insert(s:fdPaths, ch_read(a:channel) . '/**')
	endwhile
	let &path = '.,,' . s:fdPaths->sort()->uniq()->join(',')
endfunction
" }}}

" vim:foldmethod=marker
