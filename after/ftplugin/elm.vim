" Purpose: Set elm ft settings

augroup Elm
	autocmd!
augroup END

" Desc: Lint on file save
autocmd Elm BufWritePost * execute 'ElmMake'
