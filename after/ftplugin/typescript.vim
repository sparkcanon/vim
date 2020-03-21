" For gf mapping
setlocal suffixesadd+=.js
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
setlocal define=^\\s*[^/,\\":=]*\\s*[:=]*\\s*\\(class\\\|function\\\|define\\\|export\\s\\(default\\)*\\)[('\"]\\{-\\}

" Set alias setting
if fnamemodify(getcwd(), ":p:h:t") == 'lego-web'
	set includeexpr=substitute(v:fname,'^#/','web/','g')
endif

" Make on all open buffers
command! -nargs=0 MassMake call MassMake()

" Console log
command! -nargs=0 Log execute "normal oconsole.log('".expand('<cword>')
			\ . "====> ', ".expand('<cword>').")"
