" Purpose: Npm scripts

" Desc: Runner {{{
function! npm#complete(A,L,P) abort
	if filereadable("./package.json")
		let l:root_raw = readfile("./package.json")
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
	if filereadable("./package.json")
		execute 'term npm run ' . a:args
	else
		echom "Error: Package.json not found"
	endif
endfunction
" }}}

