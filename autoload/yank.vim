" Yank path
function! yank#yankPath(args) abort
	let l:init = 'let @+ = expand("$")'
	" Relative Path
	if a:args == 'relative'
		let yankRel = substitute(l:init, "\"\$\"", "\"\%\"", "")
	endif
	" Absolute Path
	if a:args == 'full'
		let yankRel = substitute(l:init, "\"\$\"", "\"\%\:p\"", "")
	endif
	" Filename
	if a:args == 'filename'
		let yankRel = substitute(l:init, "\"\$\"", "\"\%\:t\"", "")
	endif
	" Directory name
	if a:args == 'directory'
		let yankRel = substitute(l:init, "\"\$\"", "\"\%\:p\:h\"", "")
	endif
	execute ''.expand(yankRel)
endfunction
