" Purpose: General purpose path setup using fd for various projects

" Desc: Fd job to set dirsPath {{{
function! path_job#setProjectPath() abort
	let l:cmd = [ 'fd', '.',
				\ '--min-depth', '2',
				\ '-t', 'd',
				\ '-E', 'test/',
				\ '-E', 'bin/',
				\ '-E', 'eslint/',
				\ '-E', '__mocks__/',
				\ '-E', 'tests_utils/',
				\ '-E', 'docs/',
				\ '-E', 'backstop_data/',
				\ '-E', 'web/assets/' ,
				\ '-E', 'aem/' ,
				\ '-E', 'web/public/',
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

