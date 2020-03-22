augroup Elm
	autocmd!
augroup END

autocmd Elm BufWritePost * execute 'ElmMake'
