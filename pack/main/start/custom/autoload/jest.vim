" Purpose: Jest

" Desc: List jest tests and run selected {{{
function! jest#picker(A,L,P) abort
	if findfile('jest.config.js', '.;') =~ 'jest.config.js'
		if utils#isProject('lego-web')
			let l:items = systemlist('fd -g {"*.test.*,*-test.*"} -E "*.snap" --base-directory ~/Documents/work_projects/tesco/lego-web/web/')
			if a:A->len() > 0
				return l:items->matchfuzzy(a:A)
			else
				return l:items
			endif
		else
			let l:items = systemlist('fd -g {"*.test.*,*-test.*"} -E "*.snap"')
			if a:A->len() > 0
				return l:items->matchfuzzy(a:A)
			else
				return l:items
			endif
		endif
	else
		echo "Error: Jest config not found"
	endif
endfunction
" }}}

" Desc: jest runner {{{
function! jest#runner(args) abort
	if utils#isProject('lego-web')
		execute 'term fish -c "cd web && npx jest --watch ' .. a:args '"'
	else
		execute 'term npx jest --watch ' .. a:args
	endif
endfunction
" }}}
