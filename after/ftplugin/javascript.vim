setlocal suffixesadd+=.js
setlocal suffixesadd+=.jsx
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
setlocal define=^\\s*[^/,\\":=]*\\s*[:=]*\\s*\\(class\\\|function\\\|define\\\|export\\s\\(default\\)*\\)[('\"]\\{-\\}

" Set alias setting
if fnamemodify(getcwd(), ":p:h:t") == 'lego-web'
	set includeexpr=substitute(v:fname,'^#/','web/','g')
endif

compiler js

" Make on all open buffers
command! -nargs=0 MassMake call functions#massMake()

" Console log command
command! -nargs=0 Log execute "normal oconsole.log('".expand('<cword>')
			\ . "====> ', ".expand('<cword>').")"
