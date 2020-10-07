if exists("did_load_filetypes")
	finish
endif

augroup filetypedetect
	au! BufRead,BufNewFile *.js packadd! vim-jsx-pretty
	au! BufRead,BufNewFile *.fish packadd vim-fish | setfiletype fish
augroup END
