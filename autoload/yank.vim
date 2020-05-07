" Desc: Yank specified path
function! yank#yankPath(args) abort
	let l:init = 'let @+ = expand("$")'
	" Relative Path
	if a:args == 'relative'
		let l:yank = substitute(l:init, "\"\$\"", "\"\%\"", "")
	endif
	" Absolute Path
	if a:args == 'full'
		let l:yank = substitute(l:init, "\"\$\"", "\"\%\:p\"", "")
	endif
	" Filename
	if a:args == 'filename'
		let l:yank = substitute(l:init, "\"\$\"", "\"\%\:t\"", "")
	endif
	" Directory name
	if a:args == 'directory'
		let l:yank = substitute(l:init, "\"\$\"", "\"\%\:p\:h\"", "")
	endif
	execute '' . expand(l:yank)
endfunction
