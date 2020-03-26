" Purpose: set path, include expr
" Project: Tesco

" Check if its lego
if fnamemodify(getcwd(), ":p:h:t") == 'lego-web'
	" Sets import statement suffix
	" Custom alias `#` replacement
	" substitute does not like spaces between args
	setlocal includeexpr=PathSubstitue(v:fname)

	" Desc: includeexpr
	" TODO: Investigate why this is so slow
	function! PathSubstitue(fname) abort
		if a:fname =~ '^\.'
			let dotFormat = substitute(a:fname,'^\W*','','')
			return dotFormat
		endif
		if a:fname =~ '^\#'
			let aliasFormat = substitute(a:fname,'^#/','./web/','g')
			return aliasFormat
		endif
		return a:fname
	endfunction

	" Set lego specific path
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

" Check if its peas
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

