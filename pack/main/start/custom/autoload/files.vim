" Purpose: Files

" Desc: Files picker {{{
function! files#picker(A,L,P) abort
	let l:cmd = 'fd . ' .
				\ '-H ' .
				\ '--no-ignore ' .
				\ '-t f ' .
				\ '-E bin/ ' .
				\ '-E eslint/ ' .
				\ '-E __mocks__/ ' .
				\ '-E tests_utils/ ' .
				\ '-E docs/ ' .
				\ '-E backstop_data/ ' .
				\ '-E __snapshots__/ ' .
				\ '-E node_modules/ ' .
				\ '-E .git/ ' .
				\ '-E web/assets/ ' .
				\ '-E web/public/ ' .
				\ '-E web/.cache-loader/ ' .
				\ '-E .github/ ' .
				\ '-E dist/ ' .
				\ '-E tmp/ ' .
				\ '-E ".gitattributes" ' .
				\ '-E ".gitkeep" ' .
				\ '-E "*.req" ' .
				\ '-E ".DS_Store" ' .
				\ '-E "*.res" ' .
				\ '-E "coverage/"'

	let l:items = l:cmd->systemlist()
	if a:A->len() > 0
		return l:items->matchfuzzy(a:A)
	else
		return l:items
	endif
endfunction
" }}}

" Desc: Files runner {{{
function! files#runner(args) abort
	exe 'e ' .. a:args
endfunction
" }}}
