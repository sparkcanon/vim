if exists("did_load_filetypes")
	finish
endif

augroup filetypedetect
	autocmd! BufRead,BufNewFile *.js,*.jsx packadd! vim-javascript | packadd! vim-jsx-pretty
	autocmd! BufRead,BufNewFile *.ts,*.tsx packadd! yats.vim
	autocmd! BufRead,BufNewFile *.fish packadd vim-fish | setfiletype fish
augroup END
