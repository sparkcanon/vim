" Purpose: Set elm settings

" Load elm-vim package
packadd elm-vim

" Desc: Lint on file save
autocmd BufWritePost * execute 'ElmMake'
