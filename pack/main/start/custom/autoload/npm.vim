" Purpose: Run npm scripts from package json

" Desc: Runner {{{
function! npm#complete(A,L,P) abort
	if filereadable("./package.json")
		let l:root_raw = readfile("./package.json")
		let l:root_decoded = json_decode(join(l:root_raw, " "))
		if has_key(l:root_decoded, "scripts")
			if a:A->len() > 1
				return keys(l:root_decoded.scripts)->matchfuzzy(a:A)
			else
				return keys(l:root_decoded.scripts)
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

