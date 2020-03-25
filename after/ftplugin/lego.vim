" Purpose: set path, include expr
" Project: Tesco
if fnamemodify(getcwd(), ":p:h:t") == 'lego-web'
	" Sets import statement suffix
	" Custom alias `#` replacement
	" substitute does not like spaces between args
	setlocal includeexpr=substitute(v:fname,'^#/','./web/','g')

	" Set path
	setlocal path=.
	setlocal path+=web/
	setlocal path+=web/lib
	setlocal path+=web/components
	setlocal path+=web/selectors
	setlocal path+=web/experiments
	setlocal path+=web/config
	setlocal path+=web/actions
	setlocal path+=web/constants
	setlocal path+=web/analytics
	setlocal path+=web/gulp
	setlocal path+=web/reducers
	setlocal path+=web/routes
	setlocal path+=web/utils
	setlocal path+=web/views
	setlocal path+=web/middleware
	setlocal path+=web/resource-signatures
	setlocal path+=web/resourcePrep
	setlocal path+=web/tools
	setlocal path+=web/locales
	setlocal path+=web/specs
	setlocal path+=web/conditional-resources
endif

if fnamemodify(getcwd(), ":p:h:t") == 'peas'
	" Sets import statement suffix
	" eg., `path/to/file` without `index.js` at the end
	" substitute does not like spaces between args
	setlocal includeexpr=substitute(v:fname,'$','/index','g')

	" Set peas specific path
	setlocal path=.
	setlocal path+=packages/node/**
	setlocal path+=packages/web**
endif
