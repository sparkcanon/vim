" Purpose: Run npm scripts from package json

" Desc: Runner {{{
function! npm#picker() abort
	if filereadable("./package.json")
		let l:root_raw = readfile("./package.json")
		let l:root_decoded = json_decode(join(l:root_raw, " "))
		if has_key(l:root_decoded, "scripts")
			let b:root_scripts = keys(l:root_decoded.scripts)
			call quickpick#open({
						\ 'items': b:root_scripts,
						\ 'on_accept': function('s:on_accept'),
						\ })
		endif
	else
		echo "Error: Package.json not found"
	endif
endfunction

" Desc: On color picker accept selection
function! s:on_accept(data, ...) abort
  call quickpick#close()
  execute 'term npm run ' . a:data['items'][0]
endfunction

" }}}

