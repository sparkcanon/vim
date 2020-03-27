" Purpose: set path, include expr
" Project: Tesco

" Check if its lego
if functions#isProject('lego-web')

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
if functions#isProject('peas')

	" Set peas specific path
	let &path = '.,'
				\ . 'packages/node/**,'
				\ . 'packages/web/**,'
endif

