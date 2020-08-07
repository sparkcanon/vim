" Desc: Fd job to set dirsPath {{{
function! path_job#setProjectPath() abort
	if path_utils#isProject('lego-web')
		let l:depth = '--exact-depth'
	else
		let l:depth = '--max-depth'
	endif

	let l:dirs = [ 'fd', '.',
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
	let l:dirsOpt = { 'close_cb': 'FdDirHandler' }
	let l:fdDirsJob = job_start(l:dirs, l:dirsOpt)
endfunction
" }}}

let s:fdPaths = []
function! FdDirHandler(channel) abort
	while ch_status(a:channel, {'part': 'out'}) == 'buffered'
		call insert(s:fdPaths, ch_read(a:channel) . '/**')
	endwhile
	let &path = '.,,' . s:fdPaths->sort()->uniq()->join(',')
endfunction


