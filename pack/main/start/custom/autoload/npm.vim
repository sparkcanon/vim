" Purpose: Run npm scripts from package json

" Desc: Runner {{{
function! npm#picker() abort
	if filereadable("./package.json")
		let l:root_raw = readfile("./package.json")
		let l:root_decoded = json_decode(join(l:root_raw, " "))
		if has_key(l:root_decoded, "scripts")
			let b:root_scripts = keys(l:root_decoded.scripts)
			call fzf#run({
						\  'source': b:root_scripts,
						\  'sink': 'term npm run',
						\  'window': { 'width': 1, 'height': 0.3, 'yoffset': 1 } })
		endif
	else
		echo "Error: Package.json not found"
	endif
endfunction
" }}}

