" Tesco Lego related stuff
if fnamemodify(getcwd(), ":p:h:t") == 'lego-web'
	" Set alias setting
	setlocal includeexpr=substitute(v:fname,'^#/','web/','g')

	" Set path
	setlocal path=.
	setlocal path+=web/
	setlocal path+=web/lib
	setlocal path+=web/components
	setlocal path+=web/selectors
	setlocal path+=web/experiments
	setlocal path+=web/config
	setlocal path+=web/actions
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

	" Set mappings
	nnoremap <space>f :find<space>
	nnoremap <space>c :Cfind<space>
	nnoremap <space>s :sfind<space>
	nnoremap <space>v :vert sfind<space>
	nnoremap <space>t :tabfind<space>
endif
