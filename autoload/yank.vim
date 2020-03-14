" Yank path
function! yank#yankPath(args) abort
	let init = 'let @+ = expand("$")'
	" Relative Path
	if a:args == 'relative'
		let yankRel = substitute(init, "\"\$\"", "\"\%\"", "")
	endif
	" Absolute Path
	if a:args == 'full'
		let yankRel = substitute(init, "\"\$\"", "\"\%\:p\"", "")
	endif
	" Filename
	if a:args == 'filename'
		let yankRel = substitute(init, "\"\$\"", "\"\%\:t\"", "")
	endif
	" Directory name
	if a:args == 'directory'
		let yankRel = substitute(init, "\"\$\"", "\"\%\:p\:h\"", "")
	endif
	execute ''.expand(yankRel)
endfunction
