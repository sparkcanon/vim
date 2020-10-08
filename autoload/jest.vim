" Purpose: Jest utils

" Desc: List jest tests and run selected {{{
function! jest#list() abort
	if utils#isProject('lego-web')
		call fzf#run({
					\ 'source': "fd -g {'*.test.*,*-test.*'} --base-directory ~/Documents/work_projects/tesco/lego-web/web/",
					\ 'sink': 'term ./node_modules/.bin/jest --watch',
					\ 'dir': '~/Documents/work_projects/tesco/lego-web/web/',
					\ 'tmux': '-d20%' })
	else
		call fzf#run({
					\ 'source': './node_modules/.bin/jest --listTests',
					\ 'sink': 'term ./node_modules/.bin/jest --watch',
					\ 'tmux': '-d20%' })
	endif
endfunction
" }}}

" vim:foldmethod=marker
