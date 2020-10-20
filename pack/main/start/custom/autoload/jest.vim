" Purpose: Jest utils

" Desc: List jest tests and run selected {{{
function! jest#picker() abort
	if findfile('jest.config.js', '.;') =~ 'jest.config.js'
		if utils#isProject('lego-web')
			let l:items = 'fd -g {"*.test.*,*-test.*"} -E "*.snap" --base-directory ~/Documents/work_projects/tesco/lego-web/web/'
			call fzf#run({
						\ 'source': l:items,
						\ 'sink': 'term ./node_modules/.bin/jest --watch',
						\ 'dir': '~/Documents/work_projects/tesco/lego-web/web/',
						\ 'window': { 'width': 1, 'height': 0.3, 'yoffset': 1 } })
		else
			let l:items = 'fd -g {"*.test.*,*-test.*"} -E "*.snap"')
			call fzf#run({
						\ 'source': l:items,
						\ 'sink': 'term ./node_modules/.bin/jest --watch',
						\ 'window': { 'width': 1, 'height': 0.3, 'yoffset': 1 } })
		endif
	else
		echo "Error: Jest config not found"
	endif
endfunction
" }}}
