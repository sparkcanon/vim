setlocal suffixesadd+=.js
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
setlocal define=^\\s*[^/,\\":=]*\\s*[:=]*\\s*\\(class\\\|function\\\|define\\\|export\\s\\(default\\)*\\)[('\"]\\{-\\}

if fnamemodify(getcwd(), ":p:h:t") == 'lego-web'
	set includeexpr=substitute(v:fname,'^#/','web/','g')
endif
