" Purpose: Jest utils

" Desc: List jest tests and run selected {{{
function! jest#picker() abort
	if findfile('jest.config.js', '.;') =~ 'jest.config.js'
		if utils#isProject('lego-web')
			let l:items = systemlist('fd -g {"*.test.*,*-test.*"} -E "*.snap" --base-directory ~/Documents/work_projects/tesco/lego-web/web/')
		else
			let l:items = systemlist('fd -g {"*.test.*,*-test.*"} -E "*.snap"')
		endif
		call quickpick#open({
					\ 'items': l:items,
					\ 'on_accept': function('s:on_accept'),
					\ })
	else
		echo "Error: Jest config not found"
	endif
endfunction

" Desc: On accept event
function! s:on_accept(data, ...) abort
	call quickpick#close()
	execute 'term fish -c "cd web && node_modules/.bin/jest --watch ' . a:data['items'][0]
endfunction
" }}}

" vim:foldmethod=marker
