" Purpose: Npm scripts

" Desc: Runner {{{
function! npm#complete(A,L,P) abort
	let l:filePath = findfile('package.json')
	if filereadable(l:filePath)
		let l:root_raw = readfile(l:filePath)
		let l:root_decoded = l:root_raw->join(" ")->json_decode()
		if l:root_decoded->has_key("scripts")
			if a:A->len() > 0
				return l:root_decoded.scripts->keys()->matchfuzzy(a:A)
			else
				return l:root_decoded.scripts->keys()
			endif
		endif
	endif
endfunction

function! npm#runner(args) abort
	let l:filePath = findfile('package.json')
	if filereadable(l:filePath)
		let l:cd = l:filePath->split('/')[0:-2]->join('/')
		if l:cd->len() == 0
			execute 'FloatermNew ' . ' npm run ' . a:args
		else
			execute 'FloatermNew --cwd=' . l:cd . ' npm run ' . a:args
		endif
	else
		echom "Error: Package.json not found"
	endif
endfunction
" }}}

finish
frontend/package.json