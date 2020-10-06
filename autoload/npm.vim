" Purpose: Run npm scripts from package json

" Desc: Runner {{{
function! npm#scripts() abort
	if filereadable("./package.json")
		if filereadable("./web/package.json")
			let l:sec_raw = readfile("./web/package.json")
			let l:sec_decoded = json_decode(join(l:sec_raw, " "))
			if has_key(l:sec_decoded, "scripts")
				let b:sec_scripts = keys(l:sec_decoded.scripts)
			endif
		endif
		let l:root_raw = readfile("./package.json")
		let l:root_decoded = json_decode(join(l:root_raw, " "))
		if has_key(l:root_decoded, "scripts")
			let b:root_scripts = keys(l:root_decoded.scripts)
			if exists('b:sec_scripts')
				let l:scripts = b:root_scripts + b:sec_scripts
			else
				let l:scripts = b:root_scripts
			endif
			call fzf#run({
						\  'source': l:scripts,
						\  'sink': 'term npm run',
						\  'down': '40%' })
		endif
	else
		echo "No package.json found"
	endif
endfunction
" }}}

" vim:foldmethod=marker
