" Purpose: set path, include expr
" Project: Tesco
if fnamemodify(getcwd(), ":p:h:t") == 'lego-web'
	" Sets import statement suffix
	" Custom alias `#` replacement
	" substitute does not like spaces between args
	setlocal includeexpr=functions#PathSubs(v:fname)

	let &path = '.,'
				\ . 'web/,'
				\ . 'web/lib,'
				\ . 'web/components/**,'
				\ . 'web/selectors/**,'
				\ . 'web/experiments/**,'
				\ . 'web/config,'
				\ . 'web/actions,'
				\ . 'web/constants,'
				\ . 'web/analytics,'
				\ . 'web/gulp,'
				\ . 'web/reducers/**,'
				\ . 'web/routes/**,'
				\ . 'web/utils,'
				\ . 'web/views,'
				\ . 'web/middleware/**,'
				\ . 'web/resource-signatures,'
				\ . 'web/resourcePrep,'
				\ . 'web/tools,'
				\ . 'web/locales/**,'
				\ . 'web/specs,'
				\ . 'web/conditional-resources/**'
endif

if fnamemodify(getcwd(), ":p:h:t") == 'peas'
	" Sets import statement suffix
	" eg., `path/to/file` without `index.js` at the end
	" substitute does not like spaces between args
	setlocal includeexpr=substitute(v:fname,'$','/index','g')

	" Set peas specific path
	let &path = '.,'
				\ . 'packages/node/**,'
				\ . 'packages/web/**,'
endif
